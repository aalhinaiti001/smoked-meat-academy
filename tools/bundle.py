#!/usr/bin/env python3
"""Fold a built site into one self-contained HTML file.

Every page's <main> becomes a section of a single document, the shared nav and
footer appear once, the built CSS and JS are inlined, and links between pages
become in-page hashes. The result needs no server and no network beyond the
Google Fonts stylesheet, which degrades to the fallback stack offline.

Usage: npm run build && python3 tools/bundle.py [output.html] [dist-dir]
"""

import base64
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Route in the build -> (section id, order). Journal entries are discovered.
PAGES = [
    ("index.html", "home"),
    ("meat/index.html", "meat"),
    ("process/index.html", "process"),
    ("journal/index.html", "journal"),
    ("smoker-box/index.html", "smoker-box"),
    ("story/index.html", "story"),
    ("order/index.html", "order"),
]


def read(path):
    with open(path, encoding="utf-8") as fh:
        return fh.read()


def between(html, start_tag, end_tag):
    start = html.index(start_tag)
    end = html.index(end_tag, start) + len(end_tag)
    return html[start:end]


def slug_of(route):
    """`journal/brisket-12-hours/index.html` -> `journal-brisket-12-hours`."""
    path = route[: -len("/index.html")] if route.endswith("/index.html") else route[: -len(".html")]
    return path.replace("/", "-") or "home"


def collect(dist):
    routes = [(route, slug) for route, slug in PAGES if os.path.exists(os.path.join(dist, route))]
    known = {route for route, _ in routes}
    for base, _dirs, files in os.walk(os.path.join(dist, "journal")):
        for name in sorted(files):
            if name != "index.html":
                continue
            route = os.path.relpath(os.path.join(base, name), dist).replace(os.sep, "/")
            if route not in known:
                routes.append((route, slug_of(route)))
    return routes


def link_map(routes):
    """Both `/meat` and `/meat/` should resolve to the same section."""
    mapping = {}
    for route, slug in routes:
        path = "/" + route[: -len("index.html")] if route.endswith("index.html") else "/" + route
        mapping[path] = slug
        mapping[path.rstrip("/") or "/"] = slug
    return mapping


def namespace_svg_ids(html, slug):
    """Suffix SVG paint-server ids with the section, so illustrations reused
    across pages cannot collide once the pages share one document."""
    for name in set(re.findall(r"url\(#([A-Za-z][\w-]*)\)", html)):
        unique = "%s-%s" % (name, slug)
        html = html.replace('id="%s"' % name, 'id="%s"' % unique)
        html = html.replace("url(#%s)" % name, "url(#%s)" % unique)
    return html


def build(dist):
    routes = collect(dist)
    links = link_map(routes)
    index = read(os.path.join(dist, "index.html"))

    def rewrite_href(html):
        def sub(match):
            target = match.group(1)
            slug = links.get(target) or links.get(target.rstrip("/") or "/")
            return 'href="#%s"' % slug if slug else match.group(0)
        return re.sub(r'href="([^"]+)"', sub, html)

    nav = rewrite_href(between(index, '<header class="nav">', "</header>"))
    footer = rewrite_href(between(index, '<footer class="footer">', "</footer>"))

    css = "\n".join(
        read(os.path.join(dist, "_astro", name))
        for name in sorted(os.listdir(os.path.join(dist, "_astro")))
        if name.endswith(".css")
    )
    js = "\n".join(
        read(os.path.join(dist, "_astro", name))
        for name in sorted(os.listdir(os.path.join(dist, "_astro")))
        if name.endswith(".js")
    )

    favicon = "data:image/svg+xml;base64," + base64.b64encode(
        read(os.path.join(dist, "assets/img/mark.svg")).encode("utf-8")
    ).decode("ascii")

    parts = [
        "<!DOCTYPE html>",
        '<html lang="en">',
        "<head>",
        '<meta charset="utf-8">',
        '<meta name="viewport" content="width=device-width, initial-scale=1">',
        "<title>Smoked Meat Academy — Smoke. Fire. Meat.</title>",
        '<meta name="description" content="A meat-smoking concept built around fire, time and '
        'patience, bringing authentic smoked meat culture to Jordan.">',
        '<meta name="theme-color" content="#0b0908">',
        '<link rel="icon" href="%s" type="image/svg+xml">' % favicon,
        '<link rel="preconnect" href="https://fonts.googleapis.com">',
        '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>',
        '<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700'
        '&family=Inter:wght@300;400;500&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet">',
        "<style>",
        css,
        "/* ---------- single-file bundle ---------- */",
        ".page { display: none; }",
        ".page.is-current { display: block; }",
        "</style>",
        "<script>document.documentElement.classList.add('js');</script>",
        "</head>",
        "<body>",
        '<a class="skip-link" href="#main">Skip to content</a>',
        nav,
        '<div id="main">',
    ]

    for route, slug in routes:
        page = read(os.path.join(dist, route))
        main = between(page, "<main", "</main>").replace(' id="main"', "", 1)
        parts.append('<div class="page" id="%s">' % slug)
        parts.append(namespace_svg_ids(rewrite_href(main), slug))
        parts.append("</div>")

    parts += ["</div>", footer, "<script type=\"module\">", js, ROUTER, "</script>", "</body>", "</html>"]
    return "\n".join(parts) + "\n"


ROUTER = r"""
/* ---- single-file router: the hash decides which section shows ---------- */
(function () {
  'use strict';
  var pages = document.querySelectorAll('.page');
  var links = document.querySelectorAll('.nav__links a[href^="#"]');

  function show(slug, scroll) {
    var found = document.getElementById(slug) ? slug : 'home';
    Array.prototype.forEach.call(pages, function (page) {
      page.classList.toggle('is-current', page.id === found);
    });
    Array.prototype.forEach.call(links, function (a) {
      if (a.getAttribute('href') === '#' + found) {
        a.setAttribute('aria-current', 'page');
      } else {
        a.removeAttribute('aria-current');
      }
    });
    if (scroll) { window.scrollTo(0, 0); }
    var heading = document.getElementById(found).querySelector('h1');
    document.title = (heading ? heading.textContent.replace(/\s+/g, ' ').trim() + ' — ' : '')
      + 'Smoked Meat Academy';
  }

  function fromHash(scroll) {
    var slug = (location.hash || '#home').slice(1);
    if (slug === 'main' || slug === '') { slug = 'home'; }
    show(slug, scroll);
  }

  window.addEventListener('hashchange', function () { fromHash(true); });
  fromHash(false);
})();
"""


if __name__ == "__main__":
    out = sys.argv[1] if len(sys.argv) > 1 else "smoked-meat-academy.html"
    dist = sys.argv[2] if len(sys.argv) > 2 else os.path.join(ROOT, "dist")
    html = build(dist)
    with open(out, "w", encoding="utf-8") as fh:
        fh.write(html)
    print("Wrote %s (%.0f KB)" % (out, len(html.encode("utf-8")) / 1024))
