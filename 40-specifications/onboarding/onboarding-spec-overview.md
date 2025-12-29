---
artefact_type: specification
visibility: public
audience: everyone
form: text
role: specification
status: normative
owner: system-architecture
---

# Participant Onboarding — Specification Overview

## Purpose

This specification defines the **participant onboarding process** for the Digital Euro system.
It describes how an eligible participant progresses from initial registration to active participation, in accordance with the Scheme Rulebook and the system architecture.

> **Illustrative Nature:** This document demonstrates how rulebook obligations can be transformed into a technical specification suitable for downstream implementation, testing, reporting, and automation. It is **not** an official ECB specification.

## 1. Scope Definition

This table defines the precise boundaries of this specification set.

| ID | Feature / Capability | In/Out | Rationale / Reference | Trace |
| :--- | :--- | :--- | :--- | :--- |
| **SCP-ONB-01** | **Lifecycle Management** | **IN** | Management of onboarding states from `DRAFT` to `ACTIVE`. | `RULE-OPS-01` |
| **SCP-ONB-02** | **Mandatory Validations** | **IN** | Execution of checks required for eligibility and certification. | `RULE-ONB-01` |
| **SCP-ONB-03** | **Suspension/Termination** | **OUT** | Explicitly excluded from this version of the spec. | -- |
| **SCP-ONB-04** | **Re-certification** | **OUT** | Renewal processes are out of scope. | -- |
| **SCP-ONB-05** | **Fraud/Sanctions** | **OUT** | Investigations are handled by separate AML/CFT processes. | `RULE-AML-01` |
| **SCP-ONB-06** | **End-User Onboarding** | **OUT** | Wallet holder onboarding is defined in `TS-PSP-001`. | -- |
| **SCP-ONB-07** | **Vendor Integration** | **OUT** | Platform-specific integration details are left to the PSP. | -- |

## 2. Architectural Context & Assumptions

The specifications in this set are written against the following architectural constraints (`30-architecture`).

| ID | Constraint / Assumption | Description | Trace |
| :--- | :--- | :--- | :--- |
| **CTX-ONB-01** | **Intermediated Model** | PSPs operate their own internal integration layers. This spec does not prescribe PSP internal architecture. | `ARCH-MOD-01` |
| **CTX-ONB-02** | **Central Authority** | All authoritative onboarding state is maintained within the **Digital Euro Service Platform (DESP)**. | `COMP-EUR-04` |
| **CTX-ONB-03** | **Canonical Access** | All platform interactions MUST occur via the **Digital Euro Access Gateway**. | `COMP-EUR-05` |

## 3. Document Map (The Specification Set)

This feature is defined across three specialised documents.

| Spec ID | Document Title | Role | Audience |
| :--- | :--- | :--- | :--- |
| **[SPEC-FUNC]** | [`onboarding-functional-spec.md`](./onboarding-functional-spec.md) | **Functional**<br>Defines the State Machine (`DRAFT` → `ACTIVE`) and business rules. | Product Owners, Testers |
| **[SPEC-INT]** | [`onboarding-interfaces-spec.md`](./onboarding-interfaces-spec.md) | **Interfaces**<br>Defines the interaction flows between PSP Gateway and DESP Access Gateway. | Architects, Integrators |
| **[SPEC-DATA]** | [`onboarding-data-model-spec.md`](./onboarding-data-model-spec.md) | **Data Model**<br>Defines the authoritative participant entity and privacy constraints. | DBAs, Data Officers |

## 4. Normative References

The following rulebook artefacts provide the legal basis for this specification.

| Ref ID | Title | Location | Usage |
| :--- | :--- | :--- | :--- |
| **[REF-ACTORS]** | *Scheme Rulebook — Actors and Roles* | `20-rulebook/actors-and-roles.md` | Defines Participant eligibility. |
| **[REF-RULES]** | *Scheme Rulebook — Functional Onboarding* | `20-rulebook/functional-onboarding.md` | Defines certification requirements. |

## 5. Traceability Strategy

To ensure governance, every requirement in this specification set follows this chain of custody:

1.  **Origin:** Traces back to a Rulebook Rule (`RULE-*`).
2.  **Constraint:** Constrains a specific Architectural Component (`COMP-*`).
3.  **Verification:** Is designed to be testable via Conformance Tests.

Downstream artefacts (code, tests, CI/CD pipelines) **MUST** reference these Spec IDs explicitly.