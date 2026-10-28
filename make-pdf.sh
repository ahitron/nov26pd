#!/usr/bin/env bash
# Regenerate glimpses-of-higher-math.pdf from index.html with headless Chrome/Chromium.
# A temporary copy gets <base href> pointing at the live site, so relative links in the
# PDF (the Goldbach comet) open the published page instead of a local file path.
set -euo pipefail
cd "$(dirname "$0")"

SITE_URL="https://ahitron.github.io/nov26pd/"
OUT="glimpses-of-higher-math.pdf"

CHROME="${CHROME:-}"
if [ -z "$CHROME" ]; then
  for c in google-chrome google-chrome-stable chromium chromium-browser \
           "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
           /opt/pw-browsers/chromium-*/chrome-linux*/chrome; do
    if command -v "$c" >/dev/null 2>&1 || [ -x "$c" ]; then CHROME="$c"; break; fi
  done
fi
[ -n "$CHROME" ] || { echo "Chrome/Chromium not found; set CHROME=/path/to/chrome" >&2; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
sed "s|<head>|<head>\n<base href=\"$SITE_URL\">|" index.html > "$TMP/index.html"

"$CHROME" --headless --no-sandbox --disable-gpu --no-pdf-header-footer \
  --virtual-time-budget=10000 --print-to-pdf="$PWD/$OUT" "file://$TMP/index.html"
echo "Wrote $OUT"
