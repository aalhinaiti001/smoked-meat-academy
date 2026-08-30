# Smoked Meat Academy

Website for a meat-smoking house in Jordan, built around fire, smoke, meat and
craft. Dark industrial visual direction: charcoal, burnt orange, fire orange and
off-white, with drifting embers and smoke that follow the reader down the page.

The site is deliberately not shaped like a restaurant site. Instead of
Menu → About → Contact, the journey is
**Fire → Smoke → Meat → Story → Box → Order**.

Built with [Astro](https://astro.build). Every page is static HTML at the end of
the build; there is no server and no client framework.

## Getting started

```bash
npm install
npm run dev      # http://localhost:4321
```

| Script | What it does |
| --- | --- |
| `npm run dev` | Development server with hot reload |
| `npm run build` | Static build into `dist/` |
| `npm run preview` | Serve the build locally |
| `npm run check` | Type-check the components, content and data |
| `npm run qa` | Build, then check structure and internal links |
| `npm run bundle` | Build, then fold the site into one HTML file |

## How it is laid out

```
src/
  content/cuts/*.md       one file per cut on the rack
  content/journal/*.md    one file per journal entry
  content.config.ts       schemas both collections are validated against
  data/                   copy that appears in more than one place
    site.ts               name, contact details, navigation
    process.ts            the five stages
    knowledge.ts          the answers behind the #tags
    faq.ts, serving.ts    accordion content
    smoker.ts             the labelled parts of the smoker
  components/             nav, footer, cards, illustrations, atmosphere
  layouts/Base.astro      head, metadata, nav, footer, script
  pages/                  one file per route
  styles/style.css        the whole design system
  scripts/main.js         progressive enhancement, no dependencies
public/                   copied verbatim: favicon, social card, robots.txt
tools/                    qa.sh, bundle.py, social-card.sh
```

## Adding content

**A cut.** Add `src/content/cuts/<name>.md` with the frontmatter the schema
requires: name, order, tags, cut, time, wood, temperature, flavour, serve, art
and colours. It appears on `/meat` immediately, and in the filter for each of
its tags. Set `featured: true` to put it on the home page.

**A journal entry.** Add `src/content/journal/<slug>.md` with title,
description, category, readingTime, updated, tags and order. The route, the
index card and the metadata all follow from the file. Write the body in Markdown.

Anything that fails the schema fails the build with the file and field named, so
a typo cannot reach the site.

## Deployment

`.github/workflows/deploy.yml` builds on every push to `aalhin001` and deploys to
GitHub Pages. Set the repository source to **GitHub Actions** under
Settings → Pages.

The domain is controlled by one repository variable, `CUSTOM_DOMAIN`
(Settings → Secrets and variables → Actions → Variables):

- **Set** to `smokedmeatacademy.com`: the site builds for that domain and the
  workflow writes the `CNAME` into the build.
- **Unset**, as it is today: the site builds for
  `https://aalhinaiti001.github.io/smoked-meat-academy/`, which is the preview
  used while the domain still points at WordPress.com.

`DEPLOYMENT.md` has the DNS, verification and HTTPS steps. `CODE_REVIEW.md` is the
pre-launch review that produced them.

## Single-file build

`npm run bundle` folds the whole site into one self-contained HTML file: each page
becomes a section, links between pages become in-page hashes, and the CSS,
JavaScript and favicon are inlined. Useful for sending the site to someone, or
opening it with no server. The only external reference left is the Google Fonts
stylesheet, which falls back to system fonts offline.

## Still to wire up

- Ordering uses direct phone and email links. Add a secured endpoint or a hosted
  form service before introducing an on-page request form.
- Photography replaces the SVG illustrations whenever real shoot assets exist.
- Prices still need business confirmation before they are published.
- DNS for `smokedmeatacademy.com` still points at WordPress.com rather than
  GitHub Pages.
