---
artefact_type: architecture
visibility: public
audience: everyone
form: text
role: architecture
status: normative
owner: system-architecture
---

# System Architecture

This layer holds the **System Architecture**: the logical **components** of the system and their design. It is the realisation of the [Business Architecture](../25-business-architecture) (`25`), one altitude up, which defines *who interacts and who may see what*; this layer defines *which components are built to make that real*.

> The single "architecture" layer was split into Business Architecture (25) and System Architecture (30); see [`PDR-0002`](../00-project-governance/decisions/PDR-0002-split-architecture-business-system.md). The layer is named *System Architecture* rather than *Technical Architecture* to avoid overloading the word *technical* (see the naming law, [`PDR-0003`](../00-project-governance/decisions/PDR-0003-layer-naming-law.md)). In real programmes the owner boundary often falls here: the institution owns the business architecture above, a vendor builds the system architecture at this layer and below.

## Digital Euro Context

The components reflect the **High-Level Design of the Digital Euro** as communicated by the Eurosystem, structured to support the fictional specifications in this repository. Illustrative of a compliant implementation, not authoritative.

## Contents

| Artefact | Purpose | Key question answered |
| :--- | :--- | :--- |
| [`component-inventory.md`](./component-inventory.md) | The mandatory logical components. | What specific engines and services (Settlement, Alias, DESP, Access Gateway, Liquidity Engine, KMS) must be built, and what does each do? |

## Traceability Relationships

This System Architecture Set keeps the identifier **`SET-ARCH`** (so that downstream specifications continue to anchor to it with `@arch=SET-ARCH:<version>`).

- **Upstream (`25-business-architecture`):** every component realises a business-architecture choice (an interaction, a responsibility, a data boundary), which in turn satisfies a rule in `20-rulebook`.
    - *Example:* the **Alias Service** component realises the privacy-firewall identity-hashing design in `25-business-architecture/security-and-privacy-zones.md`, which satisfies the Single Identity rule.
- **Downstream (`40-specifications` and `60-code`):**
    - **Specifications (`40`):** detailed technical specifications must cite the **Architecture Set Version** (`@arch=SET-ARCH:<version>`) they realise.
    - **Code (`60`):** implementations must trace back to the components they realise.

## Governance

- **Owner:** System Architecture (in a real programme, often a vendor under the institution's authority).
- **Status:** Normative.
- **Review:** changes to components (e.g. merging or splitting a component, moving a responsibility) require a Design Decision issue and stakeholder review.

## Decision records

Decisions specific to this layer are recorded in [`_governance-local/decisions/`](./_governance-local/decisions/) as repository-local decision records (`DR-`). See [`00-project-governance/decision-records.md`](../00-project-governance/decision-records.md) for the practice.

## Final Note

A good architecture is a contract. The business architecture tells the institution how its rules are honoured; the system architecture tells the builders what to build and the auditors what to verify.
