---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: informative
owner: project-governance
---

<!--
# ------------------------------------------------------------------------------
# DISCLAIMER:
# This file is an ILLUSTRATIVE EXAMPLE of a Governance Policy definition.
# It demonstrates the LOGICAL FLOW of governance enforcement.
# It is NOT a production-ready policy and may be incomplete.
# ------------------------------------------------------------------------------
-->

# Policy-as-Code Sources

This directory contains the **source code** for the project governance rules enforced by the CI/CD pipelines.

## Logic Flow

1.  **Source**: Rules are written in Rego (OPA).
2.  **Compilation**: A specialized pipeline builds these files into a binary bundle.
3.  **Distribution**: The bundle is pushed to `registry.eurosystem.int/governance/rules-bundle`.
4.  **Enforcement**: The `01-governance-policy-enforcer` pipeline pulls this bundle and applies it to every pull request or merge request.

## Rule Definitions

*   `headers.rego`: Enforces mandatory `CLASSIFICATION` and `DISCLAIMER` headers in source files.
*   `manifest.rego`: Enforces the presence and schema of `manifest.yaml` files.
