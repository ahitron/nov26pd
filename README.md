# Glimpses of Higher Math

Resource sheet for a PD session for grades 6–12 math teachers: the irrationality of
√2, Euclid’s proof that there are infinitely many primes, the Collatz conjecture,
Goldbach’s conjecture, and the twin prime conjecture.

Live site: https://ahitron.github.io/nov26pd/

- `index.html` – the resource sheet
- `collatz.html` – interactive Collatz explorer (3n + 1, 3n − 1 and 5n + 1)
- `goldbach-comet.html` – interactive Goldbach comet
- `glimpses-of-higher-math.pdf` – printable copy of the sheet

## Updating

This repo is the source of truth for the sheet. Don’t re-export it from Claude Docs:
that would undo the fixes made here.

1. Edit `index.html` directly, and set the “Last updated” date.
2. Regenerate the PDF with headless Chrome/Chromium:

   ```bash
   ./make-pdf.sh
   ```

   Set `CHROME=/path/to/chrome` if it isn’t found automatically. Links in the PDF
   point to the live site.
3. Commit and push to `main`; GitHub Pages republishes in a minute or two.
