#!/usr/bin/env bash
# Structural checks over a built site. Run after `npm run build`.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

DIST="${1:-dist}"
if [[ ! -d "$DIST" ]]; then
  echo "No $DIST directory. Run 'npm run build' first." >&2
  exit 1
fi

mapfile -t pages < <(find "$DIST" -name '*.html' | sort)
failures=0

echo "Static QA: ${#pages[@]} HTML pages in $DIST"

for page in "${pages[@]}"; do
  for needle in '<!DOCTYPE html>' '<meta name="viewport"' '<meta name="description"' '<link rel="canonical"'; do
    if ! grep -qF "$needle" "$page"; then
      echo "FAIL: ${page#$DIST/} is missing ${needle}"
      failures=$((failures + 1))
    fi
  done
  if ! grep -qE '<h1[ >]' "$page"; then
    echo "FAIL: ${page#$DIST/} has no H1"
    failures=$((failures + 1))
  fi
done

# Every site-relative href and src must exist in the build.
while IFS=$'\t' read -r page target; do
  [[ -z "$target" ]] && continue
  case "$target" in
    \#*|mailto:*|tel:*|http:*|https:*|data:*|//*) continue ;;
  esac
  target="${target%%\#*}"
  target="${target%%\?*}"
  [[ -z "$target" ]] && continue
  if [[ "$target" == /* ]]; then
    resolved="$DIST${target}"
  else
    resolved="$(dirname "$page")/$target"
  fi
  if [[ ! -e "$resolved" && ! -e "$resolved/index.html" && ! -e "${resolved%/}.html" ]]; then
    echo "FAIL: ${page#$DIST/} links to missing target: $target"
    failures=$((failures + 1))
  fi
done < <(
  grep -HoE '(href|src)="[^"]+"' "${pages[@]}" \
    | sed -E 's#^([^:]+):(href|src)="([^"]+)".*#\1\t\3#'
)

for extra in robots.txt sitemap-index.xml .nojekyll; do
  [[ -e "$DIST/$extra" ]] || echo "WARN: $DIST/$extra is missing"
done
[[ -e "$DIST/CNAME" ]] || echo "WARN: no CNAME in the build; the custom domain is not configured"

if [[ "$failures" -gt 0 ]]; then
  echo "QA failed with $failures error(s)."
  exit 1
fi
echo "PASS: structure and internal links check out."
