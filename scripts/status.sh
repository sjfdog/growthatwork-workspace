#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=== Growth@Work umbrella ==="
git -C "${ROOT}" status --short --branch
echo

if [ -x "${ROOT}/WorthwhileGrowth/scripts/status.sh" ]; then
  echo "=== WorthwhileGrowth ==="
  "${ROOT}/WorthwhileGrowth/scripts/status.sh"
else
  echo "WorthwhileGrowth status script is missing."
fi

if [ -x "${ROOT}/RIACampaign/scripts/status.sh" ]; then
  echo "=== RIACampaign ==="
  "${ROOT}/RIACampaign/scripts/status.sh"
else
  echo "RIACampaign status script is missing."
fi
