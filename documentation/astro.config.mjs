// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
	markdown : {syntaxHighlight  :"prism"},
	integrations: [
		starlight({
			title: 'OSDev',
			social: {
				github: 'https://github.com/withastro/starlight',
			},
			sidebar: [
				{
					label: 'Bootloader',
					items: [
						// Each item here is one entry in the navigation menu.
						{ label: 'Hello World!', slug: 'bootloader/hello-world' },
					],
				},
				{
					label: 'Reference',
					autogenerate: { directory: 'reference' },
				},
			],
		}),
	],
	base : "/osdev",
	site : "https://jeremiah-blessing.github.io"
});
