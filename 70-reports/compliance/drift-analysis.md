---
report_type: compliance-drift-analysis
visibility: restricted
audience: internal-governance
derived_from:
  - specification definitions (normative source)
  - implementation code (actual state)
generation_method: automated-diff
reporting_period:
  as_of: 2025-12-30
status: normative
---

# Project Drift & Compliance Analysis

> [!IMPORTANT]
> **DISCLAIMER**: This report is **illustrative and educational**.
> It demonstrates how project evidence might be summarised in a complex institutional system.
> It does **not** represent official reporting formats, audit deliverables, or management dashboards for the Digital Euro or any other real-world project.

**Project:** Policy-to-Production Workbench
**Date:** 2025-12-30

## Report provenance and generation method

This report is a **derived artefact**, generated automatically from upstream project data.

**Primary inputs:**
- Normative Specs (`40-specifications/*.yaml`)
- Implementation Artifacts (`60-code/**/*`)
- Governance Manifests (`manifest.yaml`)

**Automation pipeline:**
- Pipeline ID: PIPELINE-REP-COMPLIANCE-01
- Pipeline purpose: Verify "What is running is what was specified"
- Pipeline location: `80-ci-cd/reports/compliance`
- Execution mode: Scheduled (Daily)

**Derivation method:**
- Comparison of declared Spec IDs in `manifest.yaml` vs. `@SpecLink` usage in code.
- Detection of "Unlinked Public APIs" (Code that exists but has no SpecLink).

**AI system used:**
- None.

**Human intervention:**
- None.

**Reproducibility note:**
Given the same commit hash, this analysis is reproducible.

This provenance section exists to demonstrate how **automated reporting mechanisms** should be made transparent, auditable, and attributable in institutional contexts. And how it can be generated automatically from structured work.

---

## Compliance Summary

| Check | Result | Description |
| :--- | :---: | :--- |
| **Manifest Integrity** | ✅ PASS | All components have a valid `manifest.yaml`. |
| **Header Compliance** | ✅ PASS | All source files contain the "Institutional Reality" header. |
| **Unmanaged Code** | ⚠️ WARN | 12 files detected without `@SpecLink` (Infrastructure/Boilerplate). |
| **Spec-Code Drift** | ✅ PASS | All implemented `@SpecLink` references exist in `40-specifications`. |

## Drift Detail: Unmanaged Code (Illustrative)

The following files contain logic but lack granular traceability to a specific requirement.
*Action Required: Verify if these are purely infrastructural.*

*   `60-code/desp/src/main/resources/application.properties` (Config)
*   `60-code/psp-1/package.json` (Config)
*   `60-code/alias-service/Cargo.toml` (Config)

## Drift Detail: Missing Implementation

The following Requirements are specified but NOT YET linked in code (Coverage Gap):

*   `REQ-SET-STL-02` (Settlement Finality) - *Status: Pending Implementation*
*   `REQ-LIQ-RES-05` (Expiry Handling) - *Status: Pending Implementation*

---
**End of Report**
