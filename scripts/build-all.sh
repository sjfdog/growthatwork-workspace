#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

default_repos=(
  "GrowthWebsite"
  "WorthwhileGrowthIndex"
  "WayFinder-Values-to-Integrated-Wealth-Experiment"
  "WayFinder-Values-to-Total-Health-Experiment"
)

if [ "$#" -gt 0 ]; then
  repos=("$@")
else
  repos=("${default_repos[@]}")
fi

for repo in "${repos[@]}"; do
  echo "=== ${repo}: npm run check ==="
  (cd "${ROOT}/${repo}" && npm run check)
  echo
  echo "=== ${repo}: npm run build ==="
  (cd "${ROOT}/${repo}" && npm run build)
  echo
done
