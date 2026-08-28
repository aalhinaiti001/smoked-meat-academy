#!/usr/bin/env bash
# Regenerate every page of the static site from the shared fragments in tools/parts.sh.
set -euo pipefail
cd "$(dirname "$0")/.."
for s in tools/build-home.sh tools/build-meat.sh tools/build-process.sh tools/build-story.sh tools/build-box.sh tools/build-journal.sh tools/build-order.sh; do
  bash "$s"
done
echo "All pages rebuilt."
