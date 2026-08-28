#!/usr/bin/env bash
# Lightweight static-site QA checks. Run from any directory.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

failures=0
pages=( *.html )

echo "Static QA: ${#pages[@]} HTML pages"

for page in "${pages[@]}"; do
  if ! grep -q '<!DOCTYPE html>' "$page"; then
    echo "FAIL: $page has no HTML5 doctype"
    failures=$((failures + 1))
  fi
  if ! grep -q '<meta name="viewport"' "$page"; then
    echo "FAIL: $page has no viewport meta tag"
    failures=$((failures + 1))
  fi
  if ! grep -q '<meta name="description"' "$page"; then
    echo "FAIL: $page has no description meta tag"
    failures=$((failures + 1))
  fi
  if ! grep -q '<h1[ >]' "$page"; then
    echo "FAIL: $page has no H1"
    failures=$((failures + 1))
  fi

done

while IFS=$'\t' read -r page target; do
  [[ -z "$target" ]] && continue
  case "$target" in
    \#*|mailto:*|tel:*|http:*|https:*|data:*|javascript:*) continue ;;
  esac
  target="${target%%\#*}"
  target="${target%%\?*}"
  [[ -z "$target" ]] && continue
  if [[ ! -e "$target" ]]; then
    echo "FAIL: $page links to missing local target: $target"
    failures=$((failures + 1))
  fi
done < <(
  grep -HioE 'href="[^"]+"|src="[^"]+"' "${pages[@]}" assets/**/*.css 2>/dev/null \
    | sed -E 's#^([^:]+):.*(href|src)="([^"]+)".*#\1\t\3#'
)

if [[ ! -f CNAME ]]; then
  echo "WARN: no CNAME file; custom-domain deployment is not prepared in the repository"
fi
if [[ ! -f robots.txt ]]; then
  echo "WARN: no robots.txt file"
fi
if [[ ! -f sitemap.xml ]]; then
  echo "WARN: no sitemap.xml file"
fi

if [[ "$failures" -gt 0 ]]; then
  echo "QA failed with $failures error(s)."
  exit 1
fi

echo "PASS: structural and local-link checks passed."
