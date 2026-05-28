#!/usr/bin/env bash
set -euo pipefail

REGION="${AWS_REGION:-us-east-1}"

aws apprunner list-services \
  --region "${REGION}" \
  --query 'ServiceSummaryList[].{Name:ServiceName,Status:Status,Url:ServiceUrl}' \
  --output table
