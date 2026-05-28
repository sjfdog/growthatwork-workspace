# Worthwhile Growth Workspace

This is project one inside the Growth@Work umbrella. It contains the original app set: the marketing site, Worthwhile Growth Index, and the WayFinder experiments.

Important:
- Each product lives in its own nested repo and deploys independently.
- The canonical docs are the `README.md` and `.env.example` files inside each repo.
- Older files such as `AWS_MIGRATION_GUIDE.md`, `AWS_DEPLOYMENT_GUIDE.md`, `COMPLETE_IMPLEMENTATION_GUIDE.md`, and `TRANSLATION_GUIDE.md` are historical context, not the first place to start.

## Client Context

Growth@Work is the broader DAllman client context. This folder is the Worthwhile Growth project family.

The RIA go-to-market campaign is a separate Growth@Work project at:

`/home/spencerf/Documents/Projects/Work/DAllman/GrowthAtWork/RIACampaign`

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

1. Open [WorthwhileGrowth.code-workspace](/home/spencerf/Documents/Projects/Work/DAllman/GrowthAtWork/WorthwhileGrowth/WorthwhileGrowth.code-workspace) in VS Code.
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

- [scripts/status.sh](/home/spencerf/Documents/Projects/Work/DAllman/GrowthAtWork/WorthwhileGrowth/scripts/status.sh): show branch and repo status for the four product repos
- [scripts/build-all.sh](/home/spencerf/Documents/Projects/Work/DAllman/GrowthAtWork/WorthwhileGrowth/scripts/build-all.sh): run `npm run check` and `npm run build` across repos
- [scripts/aws-services.sh](/home/spencerf/Documents/Projects/Work/DAllman/GrowthAtWork/WorthwhileGrowth/scripts/aws-services.sh): list current App Runner services in `us-east-1`
- [scripts/bootstrap.sh](/home/spencerf/Documents/Projects/Work/DAllman/GrowthAtWork/WorthwhileGrowth/scripts/bootstrap.sh): clone the four app repos into the expected workspace layout

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

Use the sibling `RIACampaign` workspace when the task mentions:
- RIA campaign
- Advisor Assessment
- RIA Evolution Assessment
- 5 GAPs Introduction
- RIA Briefing Series
- Market Relevance GAPs
- Growth Activation GAPs
- Client Navigation GAPs
- Integrated Life + Wealth GAPs
- Advisor + Team Capability GAPs

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
