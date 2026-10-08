---
report_type: compliance-drift-analysis
visibility: restricted
audience: ECB
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
- Normative specs (`60-specifications/**/*.md` and each set's `manifest.yaml`)
- Implementation Artifacts (`80-code/**/*`)
- Governance Manifests (`manifest.yaml`)

**Automation pipeline:**
- Pipeline ID: PIPELINE-REP-COMPLIANCE-01
- Pipeline purpose: Verify "What is running is what was specified"
- Pipeline location: `100-automation/reports/compliance`
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
| **Manifest Integrity** | ✅ PASS | Every component folder in `80-code` carries a `manifest.yaml`. |
| **Header Compliance** | ❌ FAIL | 2 source files carry no classification header: `psp-1/src/LiquidityService.ts` and `desp/.../LiquidityManager.java`. |
| **Unmanaged Code** | ✅ PASS | All 14 source files carry at least one `@SpecLink`. |
| **Spec-Code Drift** | ✅ PASS | Of 19 annotations, 6 resolve in `60-specifications` and 13 are declared pending with `:TBD`. None is broken. |

## Drift Detail: Declared Gaps

These components reference specifications that do not exist yet, and say so with the `:TBD` suffix: the Access Gateway (`SPEC-API-GW:TBD`, `SPEC-SEC-OPS:TBD`), the Alias Service (`SPEC-ALIAS-LOOKUP:TBD`, `SPEC-PRIVACY-OPS:TBD`, `SPEC-ALIAS-T01:TBD`), DESP (`SPEC-SET-CORE:TBD`) and PSP-1 (`SPEC-PSP-CORE:TBD`, `SPEC-PSP-TEST:TBD`, `SPEC-PAYMENT-INIT:TBD`).

*Action required: write those specifications, or withdraw the components' claim to implement them.*

## Drift Detail: Files Without a Classification Header

*   `80-code/psp-1/src/LiquidityService.ts` (source)
*   `80-code/desp/src/main/java/eu/eurosystem/desp/LiquidityManager.java` (source)
*   `80-code/desp/application.yml` (configuration)
*   `80-code/governance-common-nodejs/dist/index.d.ts` (generated output, excluded from governance)

The `package.json`, `package-lock.json` and `tsconfig.json` files cannot carry comments and are covered by the folder-level metadata of their component, as the classification model provides for tool-constrained artefacts.

## Drift Detail: Missing Implementation

None can be reported. A coverage gap is the set of upstream identifiers with no annotation pointing at them, and upstream identifiers are not yet assigned for the components above. This section becomes meaningful once they are.

---
**End of Report**
