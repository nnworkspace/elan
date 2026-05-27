---
artefact_type: requirements
visibility: public
audience: everyone
form: text
role: requirement
status: normative
owner: requirements-and-design
---

# Requirements

Between the **Legislative Framework** (`10-legal-framework`) and the **Scheme Rulebook** (`30-rulebook`) sits a layer that legislation does not provide and rules should not contain: a description of **what the system does and how people use it**, before any of it is hardened into binding rules.

This is the **Requirements** layer. It holds **user journeys**, **functional requirements**, and **end-to-end process flows**. It answers "what must the system do, from the user's perspective?", which the rulebook then codifies into binding obligations.

> **Naming note.** This layer is called *Requirements*, deliberately not *Functional Design*. The word "functional" elsewhere names a downstream specification artefact; allowing it to span two layers would obscure the direction of dependency. See [`PDR-0003`](../00-project-governance/decisions/PDR-0003-layer-naming-law.md).

## Purpose

The Requirements layer is the **origination** of the chain. Its goals in this repository are:

1. **Make intent explicit.** Capture user journeys and functional requirements as first-class, versioned artefacts, rather than leaving them implicit inside the rulebook.
2. **Feed the rulebook.** Each requirement is the upstream input that one or more rules codify, so the rulebook can be read as binding obligations rather than a mixture of intent and rules.
3. **Stay illustrative where it should.** User journeys describe intended outcomes; they are not themselves binding. The binding force lives one layer down, in the rulebook.

## Source material

The artefacts here are derived from the **Draft Digital Euro Scheme Rulebook V0.9**, Section 3 (*Functional requirements*) and its Annexes B1 (*Illustrative user journeys*) and B2 (*End-to-end flows*), all public.

* **Official source:** [Draft Digital Euro Scheme Rulebook V0.9 (PDF)](https://www.ecb.europa.eu/euro/digital_euro/timeline/profuse/shared/pdf/ecb.derdgp250731_Draft_digital_euro_scheme_rulebook_v0.9.en.pdf)

> **Note:** These are excerpts and summaries formatted for demonstration. They illustrate the *layer*, not the full programme's requirements.

## Contents

| Artefact | Description | Key concepts |
| :--- | :--- | :--- |
| [`onboarding-user-journey.md`](./onboarding-user-journey.md) | How a user gains access to digital euro services. | User journey, DEAN allocation, identification, alias, the User → PSP → DESP flow. |
| [`liquidity-requirements.md`](./liquidity-requirements.md) | How a user's balance is kept usable and within limits. | Funding, defunding, reverse waterfall, waterfall, holding limit. |

## Traceability relationships

- **Upstream (`10-legal-framework`):** requirements derive from the legal mandate (what the law obliges the system to enable).
- **Downstream (`30-rulebook`):** the rulebook codifies these requirements into binding rules. Each rule should be traceable back to the requirement it implements; conversely, a requirement with no rule, or a rule with no requirement, is a gap worth questioning.

## Decision records

Decisions specific to this layer are recorded in [`_governance-local/decisions/`](./_governance-local/decisions/) as repository-local decision records (`DR-`). See [`00-project-governance/decision-records.md`](../00-project-governance/decision-records.md) for the practice.
