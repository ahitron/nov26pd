# Glimpses of Higher Math

Resource sheet for a one-hour PD session for grades 6–12 math teachers: the Collatz
conjecture, Euclid’s proof that there are infinitely many primes, and Goldbach’s
conjecture (with twin primes as an extension).

Live site: https://ahitron.github.io/nov26pd/

- `index.html` – the resource sheet
- `goldbach-comet.html` – interactive Goldbach comet
- `glimpses-of-higher-math.pdf` – printable copy of the sheet

## Updating

1. Edit the sheet in Claude Docs and export it as Markdown (`resource-sheet.md`).
2. Rebuild `index.html` from the export: same HTML structure and styles, with the
   byline removed, the “Last updated” date set to today, the PDF and comet links kept,
   and the Further reading links kept. (Asking Claude Code to do this against
   `CLAUDE.md` works.)
3. Regenerate the PDF with headless Chrome/Chromium:

   ```bash
   ./make-pdf.sh
   ```

   Set `CHROME=/path/to/chrome` if it isn’t found automatically. Links in the PDF
   point to the live site.
4. Commit and push to `main`; GitHub Pages republishes in a minute or two.
