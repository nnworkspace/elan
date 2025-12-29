---
artefact_type: specification
visibility: public
audience: everyone
form: text
role: documentation
status: informative
owner: system-design
---

# Participant Onboarding Specification Set

## 1. Identity and Scope

This folder contains the **Participant Onboarding Specification Set** (`SPEC-SET-ONB`).

It defines the technical requirements, interfaces, data models, and state machines required to onboard a new Participant (PSP) onto the Digital Euro infrastructure.

### Versioning Strategy
**This folder is versioned as an atomic unit.**
The current normative version of this set is defined in the **[`manifest.yaml`](./manifest.yaml)** file. Individual Markdown files do not carry independent version numbers.

## 2. ⚠️ LEGAL NOTICE: FICTIONAL CONTENT

> **IMPORTANT:** The technical specifications contained in this folder are **FICTIONAL**.
>
> They have been created by the authors of this repository solely to **demonstrate how rigorous specifications should be structured** within a governed project.
>
> **Do not use these specifications to build actual software for the Digital Euro.**

## 3. Traceability & Dependencies

This Specification Set is not standalone. It acts as the bridge between high-level mandates and concrete verification.

### 3.1 Upstream Dependencies (Mandates)

This set implements mandates defined in the following governed sets:

- **Rulebook:** implements the *Participant Onboarding Rules* from:
    - `@rule=SET-RULEBOOK:0.9.0` (specifically `functional-onboarding.md`)
- **Architecture:** adheres to the *System Context* and *Security Zones* from:
    - `@arch=SET-ARCH:0.1.0`

### 3.2 Downstream Consumers (Verification)

The following artefacts rely on the version of this specification set:

- **Test Suite:** The logic here is verified by the Conformance Test Suite:
    - `@test=TEST-SET-ONB:0.1.1` (located in `60-tests/100-conformance-scenarios/onboarding/`)
- **Implementation:** The Reference Implementation derives its logic from here:
    - `50-code/adapter-service` (must declare compliance to `SPEC-SET-ONB:0.1.1`)

**Traceability Enforcement:**

Mismatches between the version defined in `manifest.yaml` and the versions cited by downstream consumers will be flagged by **LINT-T5 (Spec Drift)**.

## 4. The Specification Suite

The set consists of the following modular components.
Each component has a unique **Global ID** to allow precise citation in code and tests (e.g., `Ref: SPEC-OB-FUNC`).

| Global ID | File | Role |
| :--- | :--- | :--- |
| **SPEC-OB-ROOT** | [`onboarding-spec-overview.md`](./onboarding-spec-overview.md) | **Root Document**<br>Defines the Scope, Document Map, and Traceability rules. |
| **SPEC-OB-FUNC** | [`onboarding-functional-spec.md`](./onboarding-functional-spec.md) | **Functional Spec**<br>Defines the State Machine (`DRAFT` → `ACTIVE`) and business rules. |
| **SPEC-OB-INT** | [`onboarding-interfaces-spec.md`](./onboarding-interfaces-spec.md) | **Interface Spec**<br>Defines the interaction flows between PSP and Platform. |
| **SPEC-OB-DATA** | [`onboarding-data-model-spec.md`](./onboarding-data-model-spec.md) | **Data Model Spec**<br>Defines the authoritative entities and privacy constraints. |
| **SPEC-OB-API** | [`openapi.yaml`](./openapi.yaml) | **OpenAPI Definition**<br>Machine-readable contract implementing the above specs. |

## 5. Governance & Linting

This folder is subject to the following automated governance rules:

- **LINT-T2 (Anchoring):** Every specification file must reference a Rulebook ID.
- **LINT-T4 (Version Syntax):** References must include the version suffix (e.g., `:0.1.0`).
- **LINT-T5** (Spec Drift): Referenced versions must match the `RELEASED` version in the target manifest.
- **LINT-C1 (Classification):** All files must carry valid YAML metadata headers.
