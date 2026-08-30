// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

// SITE and BASE let the same source build for the custom domain and for the
// GitHub Pages project URL used while the domain is still elsewhere:
//   npm run build                                   -> https://smokedmeatacademy.com/
//   SITE=https://aalhinaiti001.github.io \
//   BASE=/smoked-meat-academy npm run build         -> project-path preview
const SITE = process.env.SITE ?? 'https://smokedmeatacademy.com';
const BASE = process.env.BASE ?? undefined;

export default defineConfig({
  site: SITE,
  base: BASE,
  trailingSlash: 'ignore',
  integrations: [sitemap()],
});
