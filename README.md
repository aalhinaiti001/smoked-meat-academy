# Smoked Meat Academy

Static website for a meat-smoking concept in Jordan, built around fire, smoke, meat
and craft. Dark industrial visual direction: charcoal, burnt orange, fire orange and
off-white, with drifting embers and smoke that follow the reader down the page.

The site is deliberately not shaped like a restaurant site. Instead of
Menu → About → Contact, the journey is
**Fire → Smoke → Meat → Story → Box → Order**.

## Pages

| File | Section |
| --- | --- |
| `index.html` | Home: hero, the smoker story, cuts, five-stage process, smoke knowledge, box, journal |
| `meat.html` | The Meat: every cut with trim, wood, temperature, hours, flavour and serving, filterable |
| `process.html` | The Process: select, season, smoke, rest, serve, plus counter questions |
| `journal.html` | Smoke Journal index |
| `journal-*.html` | Five journal articles |
| `smoker-box.html` | The Smoker Box as a product experience: contents, sizes, packaging, heating, serving |
| `story.html` | Our Story and Meet The Smoker, with an interactive smoker diagram |
| `order.html` | Direct phone and email ordering page |

## Assets

- `assets/css/style.css` — the whole design system: palette tokens, type scale, components.
- `assets/js/main.js` — navigation, ember field, scroll reveals, cut filtering, knowledge
  tags, accordions and smoker hotspots. No dependencies, no build step.
- `assets/img/mark.svg` — the brand mark, also used as the favicon. All other imagery is
  inline SVG so the site ships with no binary assets and no external requests except the
  Google Fonts stylesheet.

## Running it

There is nothing to compile. Open `index.html`, or serve the folder:

```bash
python3 -m http.server 8000
```

## Regenerating the HTML

The pages share a header, footer and several SVG fragments. Rather than duplicating them
by hand, they are generated from small shell scripts in `tools/`:

```bash
./tools/build.sh
```

Edit `tools/parts.sh` for anything shared (navigation, footer, illustrations) and the
matching `tools/build-*.sh` for a single page, then rebuild. The generated HTML is
committed, so the site can also be edited directly if you prefer, as long as shared
changes are mirrored back into `tools/`.

## Deployment

The site is prepared for GitHub Pages on the custom domain `smokedmeatacademy.com`:
`CNAME`, `.nojekyll`, `robots.txt` and `sitemap.xml` sit at the repository root, and
every page carries a canonical URL, Open Graph tags and a social card
(`assets/img/social.png`, regenerate with `tools/social-card.sh`).

`DEPLOYMENT.md` has the exact merge, Pages, DNS, verification and HTTPS steps.
`CODE_REVIEW.md` is the pre-launch review that produced them.

Before each commit:

```bash
./tools/build.sh   # regenerate the HTML
./tools/qa.sh      # structure and local-link checks
```

## Still to wire up

- Ordering uses direct phone and email links. Add a secured endpoint or hosted form
  service before introducing an on-page request form.
- Photography replaces the SVG illustrations whenever real shoot assets exist.
- Prices still need business confirmation before they are published.
- DNS for `smokedmeatacademy.com` still points at WordPress.com rather than GitHub Pages.
