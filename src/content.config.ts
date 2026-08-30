import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

// Every cut on the rack. The body of the file is the short description that
// runs under the heading on a cut card.
const cuts = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/cuts' }),
  schema: z.object({
    name: z.string(),
    order: z.number(),
    /** Categories the filter bar offers: beef, lamb, poultry, signature. */
    tags: z.array(z.string()),
    cut: z.string(),
    time: z.string(),
    wood: z.string(),
    temperature: z.string(),
    flavour: z.string(),
    serve: z.string(),
    /** Shape of the generated illustration. */
    art: z.enum(['slab', 'ribs', 'pulled', 'bird', 'links']),
    colours: z.tuple([z.string(), z.string()]),
    featured: z.boolean().default(false),
  }),
});

// Smoke Journal entries. The body is the article.
const journal = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/journal' }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    category: z.string(),
    readingTime: z.string(),
    updated: z.string(),
    tags: z.array(z.string()),
    order: z.number(),
  }),
});

export const collections = { cuts, journal };
