---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: requirements-and-design
---

# DR-0000: Adopt decision records for the requirements layer

| Field         | Value                  |
| :------------ | :--------------------- |
| Status        | Accepted               |
| Date          | 2026-05-26             |
| Deciders      | Requirements & Design  |
| Supersedes    | none                   |
| Superseded by | none                   |

## Context and problem statement

The requirements layer accumulates decisions that are costly to reverse and specific to this layer: how user journeys are scoped, how functional requirements are decomposed, which journeys are treated as illustrative versus binding inputs to the rulebook. The reasoning behind such decisions is easily lost once the discussion that produced it has faded. The project has adopted decision records as the standard mechanism for preserving that reasoning (see [`PDR-0000`](../../../00-project-governance/decisions/PDR-0000-adopt-decision-records.md)), and this layer needs a local place to keep the records that belong to it.

## Decision drivers

- Align with the project-wide decision-record practice.
- Keep each record next to the artefacts it concerns.
- Distinguish decisions local to this layer from those that cut across the project.

## Considered options

1. Record everything project-wide — log this layer's decisions as `PDR-` records in `00-project-governance/decisions/`.
2. Repository-local decision records — a `_governance-local/decisions/` folder in this layer.

## Decision

This layer adopts repository-local decision records in `_governance-local/decisions/`, following the practice defined in [`00-project-governance/decision-records.md`](../../../00-project-governance/decision-records.md). Decisions specific to this layer are recorded here as `DR-` files; only decisions that cut across layers are escalated to `PDR-` records in `00-project-governance/decisions/`.

The creation of this layer itself was a cross-cutting decision and is recorded project-wide in [`PDR-0001`](../../../00-project-governance/decisions/PDR-0001-insert-layer-20-requirements.md).

## Consequences

**Positive**

- Decisions affecting this layer are readable in place, next to the work.
- Consistent with every other layer and with the project-wide practice.

**Negative / accepted trade-offs**

- A small, recurring discipline cost for each significant decision in this layer.

**Re-evaluation triggers**

- If the project-wide practice defined in [`decision-records.md`](../../../00-project-governance/decision-records.md) changes.
