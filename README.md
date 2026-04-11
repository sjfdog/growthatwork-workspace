# GrowthAtWork Workspace

This directory is a workspace that contains four separate Git repositories plus a small set of shared handoff files.

Important:
- The root `GrowthAtWork` folder can be versioned separately as a workspace repo.
- Each product lives in its own repo and deploys independently.
- The canonical docs are the `README.md` and `.env.example` files inside each repo.
- Older files such as `AWS_MIGRATION_GUIDE.md`, `AWS_DEPLOYMENT_GUIDE.md`, `COMPLETE_IMPLEMENTATION_GUIDE.md`, and `TRANSLATION_GUIDE.md` are historical context, not the first place to start.

## Active Repos

| Repo | Purpose | GitHub | Current Deploy Target | Current Public URL |
| --- | --- | --- | --- | --- |
| `GrowthWebsite` | Marketing site with one contact-form API | `sjfdog/growth-website` | App Runner `growth-website` | `https://www.workatgrowth.com` |
| `WorthwhileGrowthIndex` | WGI assessment app with AI chat, transcript email, and growth-plan email | `sjfdog/worthwhile-growth-index` | App Runner `wgi-app` | `https://www.worthwhilegrowth.com` |
| `WayFinder-Values-to-Integrated-Wealth-Experiment` | Authenticated WayFinder app backed by Neon/Postgres | `sjfdog/wayfinder-values-to-integrated-wealth-experiment` | App Runner `wayfinder-values-integrated-wealth` | paused |
| `WayFinder-Values-to-Total-Health-Experiment` | Authenticated WayFinder app backed by Neon/Postgres | `sjfdog/wayfinder-values-to-total-health-experiment` | App Runner `wayfinder-values-total-health` | paused |

## Quick Start

If you cloned the workspace repo first, run:

```bash
./scripts/bootstrap.sh
```

That will clone the four product repos into the expected subfolders.

Then:

1. Open [GrowthAtWork.code-workspace](/home/spencerf/Documents/Projects/Work/GrowthAtWork/GrowthAtWork.code-workspace) in VS Code.
2. Pick the repo you want to work on.
3. Read that repo's `README.md`.
4. Copy that repo's `.env.example` to a local `.env` only if you need local secrets.
5. Run:

```bash
npm ci
npm run check
npm run build
```

## Helpful Workspace Scripts

These are local helper scripts for this workspace:

- [scripts/status.sh](/home/spencerf/Documents/Projects/Work/GrowthAtWork/scripts/status.sh): show branch and repo status for all four repos
- [scripts/build-all.sh](/home/spencerf/Documents/Projects/Work/GrowthAtWork/scripts/build-all.sh): run `npm run check` and `npm run build` across repos
- [scripts/aws-services.sh](/home/spencerf/Documents/Projects/Work/GrowthAtWork/scripts/aws-services.sh): list current App Runner services in `us-east-1`
- [scripts/bootstrap.sh](/home/spencerf/Documents/Projects/Work/GrowthAtWork/scripts/bootstrap.sh): clone the four app repos into the expected workspace layout

## Deployment Rules

- `git push` does not deploy App Runner by itself.
- App Runner auto-deploys when a new image is pushed to the tracked ECR image tag.
- `GrowthWebsite` and `WorthwhileGrowthIndex` are currently the only live public apps.
- `WorthwhileGrowthIndex` also has a non-production CloudFront prototype in `aws/dev-cloudfront`.
- The two WayFinder repos are database-backed server apps and are not good CloudFront candidates without a larger refactor.

## Repo Selection Guide

Use `GrowthWebsite` when the task mentions:
- `workatgrowth.com`
- the marketing site
- the contact form

Use `WorthwhileGrowthIndex` when the task mentions:
- `worthwhilegrowth.com`
- WGI scores
- transcript email
- Growth@Work Guide chat
- ElevenLabs voice

Use the WayFinder repos when the task mentions:
- login or admin
- saved assessments
- reminders
- commitments
- database changes

## Notes For Handoff

- Replit-specific wiring has already been removed from the active repos.
- All four repos build locally with standard Node tooling.
- The easiest safe workflow is:
  1. update code in the correct repo
  2. run `npm run check`
  3. run `npm run build`
  4. test locally
  5. push to GitHub
  6. if App Runner is involved, build and push the Docker image to ECR
