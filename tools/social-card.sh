#!/usr/bin/env bash
# Render tools/social-card.html to public/assets/img/social.png (1200x630) with headless Chrome.
# Set CHROME to a Chrome/Chromium binary if it is not on PATH.
set -euo pipefail
cd "$(dirname "$0")/.."
CHROME="${CHROME:-$(command -v google-chrome || command -v chromium || true)}"
if [ -z "$CHROME" ]; then
  echo "No Chrome/Chromium found. Set CHROME=/path/to/chrome and re-run." >&2
  exit 1
fi
"$CHROME" --headless --no-sandbox --disable-gpu --hide-scrollbars \
  --window-size=1200,630 --screenshot="public/assets/img/social.png" \
  "file://$PWD/tools/social-card.html"
echo "Wrote public/assets/img/social.png"
