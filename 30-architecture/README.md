---
artefact_type: architecture
visibility: public
audience: everyone
form: text
role: architecture
status: normative
owner: system-architect
---

# System Architecture

In complex institutional systems, architecture is not merely a diagram of services and databases. It is the definition of **boundaries, responsibilities, and constraints**.

A rigorous architectural definition ensures that:
1.  **Logical boundaries** align with legal and regulatory mandates (e.g., privacy firewalls).
2.  **Responsibility** is clearly assigned to specific actors (who runs the ledger? who holds the keys?).
3.  **Components** are decoupled to allow independent evolution of policy and technology.

This folder defines the **Logical Architecture** of the system. It describes *what* must be built and *how* parts relate, separate from the specific code implementations found in later layers.

## Digital Euro Context

To provide a concrete example, this architecture reflects the **High-Level Design of the Digital Euro** as communicated by the Eurosystem.

The architecture is characterized by a strict **Intermediated Model**:
- The **Eurosystem** acts as the settlement infrastructure provider and issuer.
- **Supervised Intermediaries (PSPs)** act as the gatekeepers, managing user authentication, KYC, and the "liquidity" links to commercial bank money.

This design enforces a "privacy partition": the central settlement engine processes transactions pseudonymously, while the mapping to real-world identities remains strictly within the domain of the Intermediaries.

> **Note on Accuracy:** The architectural descriptions in this folder represent our best understanding of the official ECB design choices based on public documentation available as of December 2025. They are structured to support the "fictional" specifications in this repository and should be viewed as illustrative of a compliant implementation.

## Contents

The architecture is defined through three primary views:

| Artefact | Purpose | Key Question Answered |
| :--- | :--- | :--- |
| [`system-context.md`](./system-context.md) | High-level ecosystem view. | How do the Eurosystem, PSPs, and Users interact? |
| [`component-inventory.md`](./component-inventory.md) | Logical blocks and services. | What specific engines (e.g., Liquidity, Settlement, Alias) must be built? |
| [`security-and-privacy-zones.md`](./security-and-privacy-zones.md) | Data boundaries and trust. | How is the "Privacy Firewall" between the ECB and User Identity architected? |

## Traceability Relationships

This Architecture Set (`SET-ARCH`) sits between the rules and the detailed specifications.

- **Upstream (`20-rulebook`):**
  Every architectural component exists to satisfy a Rule.
    - *Example:* The **Alias Service** component exists to satisfy the *Single Identity Principle* defined in the Rulebook.
    - **Version-Awareness:** Architectural decisions must reference the specific **Rulebook Set Version** (e.g., `@rule=SET-RULEBOOK:0.9.0`) as declared in `20-rulebook/manifest.yaml`. This ensures our design satisfies the exact rules in force at the time of design.
    - **Enforcement:** `LINT-T2` (Anchoring) and `LINT-T4` (Version Syntax).

- **Downstream (`40-specifications` & `50-code`):**
    - **Specifications (`40`):** detailed technical specifications (e.g. `SPEC-SET-ONB`) must cite the **Architecture Set Version** (e.g. `@arch=SET-ARCH:0.1.0`) they realise. This prevents specifications from implementing features that deviate from the agreed system design.
    - **Code (`50`):** Implementations must trace back to the architectural components they realise.

## Governance

- **Owner:** Lead System Architect.
- **Status:** Normative.
- **Review:** Architectural changes (e.g., moving a boundary, merging components) require a **Design Decision** issue (`[DESIGN]`) and broad stakeholder review.

## Final Note

A good architecture is a contract. It tells the builders what to build, the auditors what to verify, and the policy-makers how their rules are enforced in silicon.