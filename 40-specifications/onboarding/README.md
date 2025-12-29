---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: informative
owner: system-architect
---

# Technical Specifications

## 1. Scope and Methodology

This folder contains the **Technical Specifications** (TS) set that define the binding state of the system.

Each file has a distinct role. Together they form a complete, layered specification
governing how liquidity is reserved, consumed, and released within the Digital Euro system.


## 2. ⚠️ LEGAL NOTICE: FICTIONAL CONTENT

> **IMPORTANT:** The technical specifications contained in this folder are **FICTIONAL**.
>
> They have been created by the authors of this repository solely to **demonstrate how rigorous specifications should be structured** within a governed project.
>
> **Do not use these specifications to build actual software for the Digital Euro.**


## 3. The Specification Registry

The specifications in this folder are organised as a modular **Standardisation Set**.

### Feature: Participant Onboarding

| ID | Title | Role |
| :--- | :--- | :--- |
| **[SPEC-ROOT]** | [`onboarding-spec-overview.md`](./onboarding-spec-overview.md) | **Root Document**<br>Defines the Scope, Document Map, and Traceability rules. |
| **[SPEC-FUNC]** | [`onboarding-functional-spec.md`](./onboarding-functional-spec.md) | **Functional Spec**<br>Defines the State Machine (`DRAFT` → `ACTIVE`) and business rules. |
| **[SPEC-INT]** | [`onboarding-interfaces-spec.md`](./onboarding-interfaces-spec.md) | **Interface Spec**<br>Defines the interaction flows between PSP and Platform. |
| **[SPEC-DATA]** | [`onboarding-data-model-spec.md`](./onboarding-data-model-spec.md) | **Data Model Spec**<br>Defines the authoritative entities and privacy constraints. |
| **[SPEC-API]** | [`openapi.yaml`](./openapi.yaml) | **OpenAPI Definition**<br>Machine-readable contract implementing the above specs. |

## 4. Governance & Linting

* **LINT-T2 (Traceability):** All specifications MUST include a "Normative References" clause linking to the Rulebook.
* **LINT-V1 (Visibility):** Public specifications cannot reference Confidential internal documents.

