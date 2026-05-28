# Growth@Work Agent Guide

This file is for AI agents or engineers arriving cold.

## First Step

Identify which project family the request belongs to before touching files.

- Use `WorthwhileGrowth` for:
  - `workatgrowth.com`
  - `worthwhilegrowth.com`
  - Worthwhile Growth Index / WGI
  - WayFinder
  - GrowthWebsite

- Use `RIACampaign` for:
  - RIA campaign
  - Advisor Assessment
  - RIA Evolution Assessment
  - 5 GAPs Introduction
  - RIA Briefing Series

## Rules

- `GrowthAtWork` is the umbrella folder.
- `WorthwhileGrowth` is project one.
- `RIACampaign` is a separate Growth@Work project, not part of WGI.
- Each actual application repo has its own Git origin and deploys independently.
- Read the project-level `AGENTS.md` before modifying code.
- Do not move apps between project folders unless the user explicitly asks for a restructure.

## Commands

```bash
./scripts/bootstrap.sh
./scripts/status.sh
./scripts/build-all.sh
```
