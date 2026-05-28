#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ -x "${ROOT}/WorthwhileGrowth/scripts/build-all.sh" ]; then
  "${ROOT}/WorthwhileGrowth/scripts/build-all.sh"
fi

if [ -x "${ROOT}/RIACampaign/scripts/build-all.sh" ]; then
  "${ROOT}/RIACampaign/scripts/build-all.sh"
fi
