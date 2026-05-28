# GrowthAtWork Agent Guide

This file is for AI agents or engineers arriving cold.

## First Principles

- The root folder is a workspace Git repo for shared handoff docs, VS Code settings, and helper scripts.
- Each product is a nested Git repo with its own `origin`.
- Read the target repo's `README.md` before touching code.
- Prefer the repo `README.md` and `.env.example` over older migration or implementation guides.
- Run `./scripts/bootstrap.sh` after cloning the workspace repo if the nested product repos are missing.

## Repo Map

- `GrowthWebsite`
  - domain: `https://www.workatgrowth.com`
  - App Runner service: `growth-website`
  - job: marketing site plus `POST /api/contact`

- `WorthwhileGrowthIndex`
  - domain: `https://www.worthwhilegrowth.com`
  - App Runner service: `wgi-app`
  - job: WGI assessment plus:
    - `POST /api/growth-chat`
    - `POST /api/send-transcript`
    - `POST /api/send-growth-plan`

- `WayFinder-Values-to-Integrated-Wealth-Experiment`
  - App Runner service: `wayfinder-values-integrated-wealth`
  - currently paused
  - job: full authenticated app backed by Postgres

- `WayFinder-Values-to-Total-Health-Experiment`
  - App Runner service: `wayfinder-values-total-health`
  - currently paused
  - job: full authenticated app backed by Postgres

AWS also contains a paused App Runner service named `Wayfinder`. It is not mapped to one of the four active repos above; do not change it unless the user explicitly asks.

## Canonical Workflow

1. Identify the correct repo.
2. Read that repo's `README.md`.
3. Inspect `package.json`, `server/routes.ts`, and `server/index.ts`.
4. Run:

```bash
npm run check
npm run build
```

5. If touching deployment behavior, verify the live service configuration with AWS CLI rather than assuming.

## Deployment Truths

- App Runner does not deploy on `git push`.
- App Runner deploys on ECR image push.
- `GrowthWebsite` and `WorthwhileGrowthIndex` are containerized production apps.
- `WorthwhileGrowthIndex` also has a dev CloudFront prototype under `aws/dev-cloudfront`.
- The two WayFinder apps have database and scheduler concerns; treat them as single-instance server apps unless the scheduler is redesigned.

## Current Environment Rules

- `GrowthWebsite`
  - required runtime env: `RESEND_API_KEY`, `RESEND_FROM_EMAIL`
  - optional runtime env: `RESEND_TO_EMAIL`

- `WorthwhileGrowthIndex`
  - required runtime env: `OPENAI_API_KEY`, `RESEND_API_KEY`
  - recommended runtime env: `RESEND_FROM_EMAIL`
  - required build args for full feature parity: `SITE_URL`, `VITE_ELEVEN_LABS_API_KEY`

- `WayFinder-*`
  - required runtime env: `DATABASE_URL`, `SESSION_SECRET`, `OPENAI_API_KEY`, `AI_INTEGRATIONS_OPENAI_API_KEY`, `RESEND_API_KEY`
  - optional runtime env: `AI_INTEGRATIONS_OPENAI_BASE_URL`, `PORT`

## Known Gotchas

- `GrowthWebsite` still has historical database docs, but the live runtime only uses Resend.
- `WorthwhileGrowthIndex` has build-time client env for ElevenLabs. Rebuilding without it silently degrades voice features.
- The WayFinder repos contain a lot of historical implementation markdown. Those files are useful background, but not the fastest path to the operational truth.
- The WayFinder email sender is still hardcoded to `onboarding@resend.dev` in `server/email.ts`.

## Useful Local Commands

```bash
./scripts/bootstrap.sh
./scripts/status.sh
./scripts/build-all.sh
./scripts/aws-services.sh
```
