---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: informative
owner: business-architecture
---

# Decision records — Business Architecture

This folder holds the **repository-local decision records** (`DR-`) for the business architecture layer: records of decisions confined to this layer, such as where trust boundaries are drawn, data-visibility rules, and the design of the privacy firewall.

Decisions that cut across layers are recorded as `PDR-` records in [`00-project-governance/decisions/`](../../../00-project-governance/decisions/), not here.

The practice, the lifecycle, the immutability rule, and the record template are defined in [`00-project-governance/decision-records.md`](../../../00-project-governance/decision-records.md).

To add a record, copy [`DR-TEMPLATE.md`](../../../00-project-governance/decisions/DR-TEMPLATE.md) into this folder, rename it to the next free `DR-NNNN-short-kebab-title.md`, and fill it in.

## Index

| ID      | Title                                 | Status   |
| :------ | :------------------------------------ | :------- |
| DR-0000 | Adopt decision records for this layer | Accepted |
