import { defineConfig } from 'vite';
import { readdirSync } from 'node:fs';
import { resolve } from 'node:path';

const rootDir = __dirname;

const htmlEntries = readdirSync(rootDir)
  .filter((fileName) => fileName.toLowerCase().endsWith('.html'))
  .reduce((entries, fileName) => {
    entries[fileName] = resolve(rootDir, fileName);
    return entries;
  }, {});

export default defineConfig({
  build: {
    rollupOptions: {
      input: htmlEntries,
    },
  },
});
