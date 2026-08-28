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
| `order.html` | Order and booking request form |

## Assets

- `assets/css/style.css` — the whole design system: palette tokens, type scale, components.
- `assets/js/main.js` — navigation, ember field, scroll reveals, cut filtering, knowledge
  tags, accordions, smoker hotspots, order form. No dependencies, no build step.
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

The site is prepared for GitHub Pages on the custom domain `smokemeatacademy.com`:
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

- The order form is front-end only. Point it at a booking endpoint or a form service.
- Photography replaces the SVG illustrations whenever real shoot assets exist.
- Prices, phone number and email are placeholders. If the mailbox should be
  `hello@smokemeatacademy.com`, provision it first, then update `tools/parts.sh` and
  `tools/build-order.sh` and rebuild.
- DNS for `smokemeatacademy.com` is not configured yet, so the domain does not resolve.
