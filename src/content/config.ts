import { defineCollection, z } from "astro:content";

const blog = defineCollection({
	type: "content",
	schema: z.object({
		title: z.string(),
		description: z.string(),
		pubDate: z.date(),
		updatedDate: z.date().optional(),
		author: z.string(),
		tags: z.array(z.string()).default([]),
		draft: z.boolean().default(false),
	}),
});

const services = defineCollection({
	type: "content",
	schema: ({ image }) =>
		z.object({
			title: z.string(),
			copy: z.string(),
			order: z.number(),
			image: image(),
		}),
});

const staff = defineCollection({
	type: "content",
	schema: ({ image }) =>
		z.object({
			name: z.string(),
			title: z.string(),
			order: z.number(),
			photo: image(),
		}),
});

export const collections = { blog, services, staff };
