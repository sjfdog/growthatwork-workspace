#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

repos=(
  "GrowthWebsite"
  "WorthwhileGrowthIndex"
  "WayFinder-Values-to-Integrated-Wealth-Experiment"
  "WayFinder-Values-to-Total-Health-Experiment"
)

for repo in "${repos[@]}"; do
  echo "=== ${repo} ==="
  git -C "${ROOT}/${repo}" status --short --branch
  git -C "${ROOT}/${repo}" remote -v | sed -n '1,2p'
  echo
done
