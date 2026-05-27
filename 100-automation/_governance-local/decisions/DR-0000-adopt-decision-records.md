---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: engineering
---

# DR-0000: Adopt decision records for the automation layer

| Field         | Value       |
| :------------ | :---------- |
| Status        | Accepted    |
| Date          | 2025-12-29  |
| Deciders      | Engineering |
| Supersedes    | none        |
| Superseded by | none        |

## Context and problem statement

The automation layer accumulates decisions that are costly to reverse and specific to this layer: pipeline structure, the division between gatekeeping, analytical, and advisory automation, tooling choices. The reasoning behind such decisions is easily lost once the discussion that produced it has faded. The project has adopted decision records as the standard mechanism for preserving that reasoning (see [`PDR-0000`](../../../00-project-governance/decisions/PDR-0000-adopt-decision-records.md)), and this layer needs a local place to keep the records that belong to it.

## Decision drivers

- Align with the project-wide decision-record practice.
- Keep each record next to the artefacts it concerns.
- Distinguish decisions local to this layer from those that cut across the project.

## Considered options

1. Record everything project-wide — log this layer's decisions as `PDR-` records in `00-project-governance/decisions/`.
2. Repository-local decision records — a `_governance-local/decisions/` folder in this layer.

## Decision

This layer adopts repository-local decision records in `_governance-local/decisions/`, following the practice defined in [`00-project-governance/decision-records.md`](../../../00-project-governance/decision-records.md). Decisions specific to this layer are recorded here as `DR-` files; only decisions that cut across layers are escalated to `PDR-` records in `00-project-governance/decisions/`.

Option 1 would scatter layer-specific reasoning away from the artefacts it explains, and inflate the project-wide sequence with local detail.

## Consequences

**Positive**

- Decisions affecting this layer are readable in place, next to the work.
- Consistent with every other layer and with the project-wide practice.

**Negative / accepted trade-offs**

- A small, recurring discipline cost for each significant decision in this layer.

**Re-evaluation triggers**

- If the project-wide practice defined in [`decision-records.md`](../../../00-project-governance/decision-records.md) changes.
