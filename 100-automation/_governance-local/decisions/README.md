---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: informative
owner: engineering
---

# Decision records — Automation & Governance Engineering

This folder holds the **repository-local decision records** (`DR-`) for the automation layer: records of decisions confined to this layer, such as structural choices, tooling, and conventions specific to its artefacts.

Decisions that cut across layers are recorded as `PDR-` records in [`00-project-governance/decisions/`](../../../00-project-governance/decisions/), not here.

The practice, the lifecycle, the immutability rule, and the record template are defined in [`00-project-governance/decision-records.md`](../../../00-project-governance/decision-records.md).

To add a record, copy this layer's [`DR-TEMPLATE.md`](./DR-TEMPLATE.md), rename it to the next free `DR-NNNN-short-kebab-title.md`, and fill it in. The template is local to this layer and may be tailored to its nature.

## Index

| ID      | Title                                 | Status   |
| :------ | :------------------------------------ | :------- |
| DR-0000 | Adopt decision records for this layer | Accepted |
