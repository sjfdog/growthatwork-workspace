# Growth@Work Workspace

This is the umbrella workspace for Growth@Work client projects under DAllman.

Keep project families separate:

```text
/home/spencerf/Documents/Projects/Work/DAllman/
  GrowthAtWork/
    WorthwhileGrowth/
      GrowthWebsite/
      WorthwhileGrowthIndex/
      WayFinder-Values-to-Integrated-Wealth-Experiment/
      WayFinder-Values-to-Total-Health-Experiment/
    RIACampaign/
      AdvisorAssessment/
      RIABriefingSeries/
```

## Project Map

| Folder | Purpose | Workspace repo |
| --- | --- | --- |
| `WorthwhileGrowth` | Original Growth@Work project set: marketing site, Worthwhile Growth Index, and WayFinder apps | `sjfdog/growthatwork-workspace` |
| `RIACampaign` | RIA go-to-market campaign assets | `sjfdog/dallman-ria-campaign-workspace` |

## Quick Start

After cloning this workspace repo, run:

```bash
./scripts/bootstrap.sh
```

Then open [GrowthAtWork.code-workspace](/home/spencerf/Documents/Projects/Work/DAllman/GrowthAtWork/GrowthAtWork.code-workspace).

For project-specific work:

- Use [WorthwhileGrowth/README.md](/home/spencerf/Documents/Projects/Work/DAllman/GrowthAtWork/WorthwhileGrowth/README.md) for WGI, WayFinder, and the current marketing site.
- Use [RIACampaign/README.md](/home/spencerf/Documents/Projects/Work/DAllman/GrowthAtWork/RIACampaign/README.md) for the RIA campaign.

## Helpful Scripts

- [scripts/bootstrap.sh](/home/spencerf/Documents/Projects/Work/DAllman/GrowthAtWork/scripts/bootstrap.sh): clone or prepare nested repos
- [scripts/status.sh](/home/spencerf/Documents/Projects/Work/DAllman/GrowthAtWork/scripts/status.sh): show status for the umbrella and both project workspaces
- [scripts/build-all.sh](/home/spencerf/Documents/Projects/Work/DAllman/GrowthAtWork/scripts/build-all.sh): run project build checks where available
