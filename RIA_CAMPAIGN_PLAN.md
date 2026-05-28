# RIA Campaign Migration Plan

This is a planned sibling project family for the DAllman client. It is Growth@Work work, but it is not part of the existing Worthwhile Growth Index / WayFinder app workspace.

## Source Context

The client described a go-to-market campaign for Registered Investment Advisors with six Replit-hosted digital assets. Based on the URL structure, these appear to be two actual Replit applications:

- Advisor Assessment: `advisor-assessment-tool-version-5.replit.app`
- RIA Briefing Series: `ria-journey-briefings.replit.app`

The briefing pages below appear to be routes inside the briefing-series app:

- Introduction to RIA Briefing Series: `/`
- RIA Briefing 1, Market Relevance GAPs: `/briefing-1/`
- RIA Briefing 2, Growth Activation GAPs: `/briefing-2/`
- RIA Briefing 3, Client Navigation GAPs: `/briefing-3/`
- RIA Briefing 4, Integrated Life + Wealth GAPs: `/briefing-4/`
- RIA Briefing 5, Advisor + Team Capability GAPs: `/briefing-5/`

## Recommended Local Structure

```text
/home/spencerf/Documents/Projects/Work/DAllman/
  GrowthAtWork/
  RIACampaign/
    README.md
    AGENTS.md
    RIACampaign.code-workspace
    scripts/
    AdvisorAssessment/
    RIABriefingSeries/
```

Do not place the RIA Campaign apps inside the existing WGI/WayFinder `GrowthAtWork` workspace unless the user explicitly asks for that.

## Recommended GitHub Repos

- `sjfdog/dallman-ria-campaign-workspace`
- `sjfdog/dallman-ria-advisor-assessment`
- `sjfdog/dallman-ria-briefing-series`

Use one repo per actual app, plus one workspace repo for handoff docs and bootstrap scripts.

## Product Map

The campaign pathway has three steps:

1. The 5 GAPs Introduction
2. The Personal 5 GAPs Library
3. The RIA Evolution Assessment

The briefing-series app should likely own the introduction and library experience. The advisor-assessment app should own the RIA Evolution Assessment.

## Naming Map

| Campaign Asset | Local Folder | GitHub Repo |
| --- | --- | --- |
| Advisor Assessment / RIA Evolution Assessment | `AdvisorAssessment` | `dallman-ria-advisor-assessment` |
| Introduction and RIA Briefing Series | `RIABriefingSeries` | `dallman-ria-briefing-series` |
| Workspace docs and scripts | `RIACampaign` | `dallman-ria-campaign-workspace` |

## Expected Migration Workflow

When the Replit exports arrive:

1. Put the zip files under `/home/spencerf/Downloads/DAllman/RIACampaign/`.
2. Unzip each export into the planned local folders.
3. Remove Replit-only files and dependencies.
4. Add or update `README.md`, `AGENTS.md`, `.env.example`, `.gitignore`, and deployment files.
5. Run `npm ci`, `npm run check`, and `npm run build` where supported.
6. Decide deployment target per app after inspecting whether each app is static or server-backed.
7. Create GitHub repos and push cleaned histories.
8. Deploy only after local build and smoke tests pass.

## Deployment Guess

- `RIABriefingSeries` is likely a static or mostly static app and may fit S3 plus CloudFront.
- `AdvisorAssessment` depends on whether it stores leads, sends emails, or uses a database. If it is static with a small API, use S3 plus CloudFront plus Lambda/API Gateway. If it is a server app, use App Runner.

Confirm by inspecting the Replit export before choosing.
