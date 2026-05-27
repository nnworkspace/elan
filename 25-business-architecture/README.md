---
artefact_type: architecture
visibility: public
audience: everyone
form: text
role: architecture
status: normative
owner: business-architecture
---

# Business Architecture

"Architecture" in a regulated, multi-stakeholder system is two different things at two different altitudes. This layer holds the first: the **Business Architecture**, how the actors interact, who sees which data, the privacy and data-governance design, the interaction shape of the system. The second, the **Technical Architecture** (the components and their design), lives one layer down in [`30-technical-architecture`](../30-technical-architecture).

Separating them makes a consequential boundary legible. Business architecture derives from the rulebook and expresses intent; technical architecture realises it. In real programmes the two frequently sit under **different owners**, the institution owning the business architecture, a vendor owning the technical architecture, with artefacts crossing that boundary. (Here the Digital Euro is used only to illustrate; the split itself is domain-agnostic. See [`PDR-0002`](../00-project-governance/decisions/PDR-0002-split-architecture-business-technical.md).)

## Purpose

1. **Define interactions and responsibilities.** Which actors exist, what each is responsible for, and how they relate (the system context).
2. **Define data visibility and privacy.** Who may see which data, and the trust boundaries that enforce it (the privacy firewall).
3. **Stay above implementation.** This layer says *what the system must do and who may know what*, not *which components are built*. Components are the technical architecture's concern.

## Source material

Derived from the public **High-Level Design of the Digital Euro** as communicated by the Eurosystem, structured to illustrate the layer. Illustrative of a compliant design, not an authoritative one.

## Contents

| Artefact | Purpose | Key question answered |
| :--- | :--- | :--- |
| [`system-context.md`](./system-context.md) | High-level ecosystem and domain responsibilities. | How do the Eurosystem, PSPs, and Users interact, and who is responsible for what? |
| [`security-and-privacy-zones.md`](./security-and-privacy-zones.md) | Trust boundaries and data-visibility zones. | How is the privacy firewall between the central infrastructure and user identity designed, and who may see which data? |

## Traceability relationships

This Business Architecture Set (`SET-BUSINESS-ARCH`) sits between the rulebook and the technical architecture.

- **Upstream (`20-rulebook`):** every business-architecture choice exists to satisfy a rule. Architectural artefacts reference the specific **Rulebook Set Version** (e.g. `@rule=SET-RULEBOOK:0.9.0`).
- **Downstream (`30-technical-architecture`):** the technical architecture realises this business architecture. The components in Layer 30 must trace back to the interactions, responsibilities, and data boundaries defined here.

## Decision records

Decisions specific to this layer are recorded in [`_governance-local/decisions/`](./_governance-local/decisions/) as repository-local decision records (`DR-`). See [`00-project-governance/decision-records.md`](../00-project-governance/decision-records.md) for the practice.
