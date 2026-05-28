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

  if [ -e "${ROOT}/${dir_name}" ] && [ -n "$(find "${ROOT}/${dir_name}" -mindepth 1 -maxdepth 1 -print -quit)" ]; then
    echo "Exists but is not a git repo: ${dir_name}"
    return 0
  fi

  mkdir -p "$(dirname "${ROOT}/${dir_name}")"
  echo "Cloning ${repo_url} -> ${dir_name}"
  git clone "${repo_url}" "${ROOT}/${dir_name}"
}

clone_if_missing "https://github.com/sjfdog/growth-website.git" "WorthwhileGrowth/GrowthWebsite"
clone_if_missing "https://github.com/sjfdog/worthwhile-growth-index.git" "WorthwhileGrowth/WorthwhileGrowthIndex"
clone_if_missing "https://github.com/sjfdog/wayfinder-values-to-integrated-wealth-experiment.git" "WorthwhileGrowth/WayFinder-Values-to-Integrated-Wealth-Experiment"
clone_if_missing "https://github.com/sjfdog/wayfinder-values-to-total-health-experiment.git" "WorthwhileGrowth/WayFinder-Values-to-Total-Health-Experiment"
clone_if_missing "https://github.com/sjfdog/dallman-ria-campaign-workspace.git" "RIACampaign"

if [ -x "${ROOT}/RIACampaign/scripts/bootstrap.sh" ]; then
  "${ROOT}/RIACampaign/scripts/bootstrap.sh"
fi

echo
echo "Growth@Work bootstrap complete."
echo "Next step: open ${ROOT}/GrowthAtWork.code-workspace in VS Code."
