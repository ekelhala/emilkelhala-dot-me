import { defineCollection, z } from 'astro:content';

const projects = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string(),
    tags: z.array(z.string()).optional(),
    link: z.string().url().optional(),
    github: z.string().url().optional(),
    featured: z.boolean().default(false),
    year: z.number().optional(),
  }),
});

export const collections = { projects };
