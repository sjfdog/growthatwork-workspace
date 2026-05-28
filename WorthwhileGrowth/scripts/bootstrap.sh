#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

clone_if_missing() {
  local repo_url="$1"
  local dir_name="$2"

  if [ -d "${ROOT}/${dir_name}/.git" ]; then
    echo "Already present: ${dir_name}"
    return 0
  fi

  echo "Cloning ${repo_url} -> ${dir_name}"
  git clone "${repo_url}" "${ROOT}/${dir_name}"
}

clone_if_missing "https://github.com/sjfdog/growth-website.git" "GrowthWebsite"
clone_if_missing "https://github.com/sjfdog/worthwhile-growth-index.git" "WorthwhileGrowthIndex"
clone_if_missing "https://github.com/sjfdog/wayfinder-values-to-integrated-wealth-experiment.git" "WayFinder-Values-to-Integrated-Wealth-Experiment"
clone_if_missing "https://github.com/sjfdog/wayfinder-values-to-total-health-experiment.git" "WayFinder-Values-to-Total-Health-Experiment"

echo
echo "Worthwhile Growth bootstrap complete."
echo "Next step: open ${ROOT}/WorthwhileGrowth.code-workspace in VS Code."
