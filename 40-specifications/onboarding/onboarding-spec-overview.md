---
artefact_type: specification
visibility: public
audience: everyone
form: text
role: specification
status: normative
owner: system-design
---

# Specification Overview: Participant Onboarding

## 1. Identification
- **Global ID:** `SPEC-OB-ROOT`
- **Part of Set:** `SPEC-SET-ONB`
- **Version:** Inherits from `manifest.yaml`

## 2. Purpose and Scope
This document defines the **technical scope** for onboarding Users and Payment Service Providers (PSPs) into the Digital Euro ecosystem.

It translates the high-level policy rules defined in the **Scheme Rulebook** into concrete technical requirements, strictly adhering to the privacy boundaries defined in the **System Architecture**.

### 2.1 In Scope
- **User Identity Resolution:** The mechanism to enforce "One Person / One Identity" (`Rule ONB-01`) via the **Alias Service** (`COMP-EUR-02`), orchestrated by the **DESP** (`COMP-EUR-04`).
- **Wallet Provisioning:** The technical lifecycle of creating a Digital Euro Account (`Rule ONB-03`) via the **Access Gateway** (`COMP-EUR-05`).
- **Intermediary Checks:** Interfaces for PSPs to signal KYC/AML compliance (`Rule ONB-02`) from their local **PSP Adapter** (`COMP-PSP-01`).
- **Portability Checks:** Logic to verify holding limits when a user opens an account at a second PSP (`Rule ONB-04`).

### 2.2 Out of Scope
- **Commercial Bank Money Liquidity:** Defined in `SPEC-LIQ` (Liquidity Management).
- **Offline Secure Element Provisioning:** Defined in `SPEC-OFFLINE`.

## 3. Normative References (Upstream Traceability)

The requirements in this specification set are derived **exclusively** from the following mandated baselines.

### 3.1 Legal & Rulebook Basis
This specification satisfies the mandates of **Rulebook Set v0.9.0** (`@rule=SET-RULEBOOK:0.9.0`).

| Rule ID | Rule Name | Upstream Source |
| :--- | :--- | :--- |
| **ONB-01** | Single Identity Principle | [`functional-onboarding.md`](../../20-rulebook/functional-onboarding.md) |
| **ONB-02** | Intermediary Responsibility | [`functional-onboarding.md`](../../20-rulebook/functional-onboarding.md) |
| **ONB-03** | Digital Euro Account Creation | [`functional-onboarding.md`](../../20-rulebook/functional-onboarding.md) |
| **ONB-04** | Portability & Limits | [`functional-onboarding.md`](../../20-rulebook/functional-onboarding.md) |

### 3.2 Architectural Basis
This specification adheres to the components and security zones defined in **Architecture Set v0.1.0** (`@arch=SET-ARCH:0.1.0`).

| Component ID | Name | Role in Onboarding |
| :--- | :--- | :--- |
| **COMP-EUR-05** | **Access Gateway** | The **only** API entry point. Authenticates PSPs and validates schema. |
| **COMP-EUR-04** | **DESP Platform** | The orchestrator. Executes business logic (Rate Limits, Status Checks). |
| **COMP-EUR-02** | **Alias Service** | The System of Record. Stores unique Identity Hashes (Zone B). |
| **COMP-PSP-01** | **PSP Adapter** | The client. Performs KYC and computes Identity Hash (Zone A). |

## 4. Document Map (The Set)

The specification is split into three orthogonal views to ensure clarity and linting enforcement.

| View | Document | Global ID | Purpose |
| :--- | :--- | :--- | :--- |
| **Behavior** | [`onboarding-functional-spec.md`](./onboarding-functional-spec.md) | **SPEC-OB-FUNC** | **"The Logic"**<br>Defines State Machines (e.g., `PENDING_KYC` -> `ACTIVE`) and validation rules. |
| **Data** | [`onboarding-data-model-spec.md`](./onboarding-data-model-spec.md) | **SPEC-OB-DATA** | **"The Schema"**<br>Defines the `UserIdentityHash` and `Account` entities. |
| **Interfaces** | [`onboarding-interfaces-spec.md`](./onboarding-interfaces-spec.md) | **SPEC-OB-INT** | **"The Flow"**<br>Sequence diagrams and API interactions. |

## 5. Design Principles

### 5.1 Privacy by Design (The Firewall)
In accordance with `security-and-privacy-zones.md`, the Eurosystem (`Zone B`) **MUST NOT** receive clear-text identity data.
- **Mechanism:** The PSP Adapter (`Zone A`) computes a one-way hash of the user's national ID.
- **Constraint:** The **Alias Service** (`COMP-EUR-02`) operates exclusively on these hashes. The **Access Gateway** (`COMP-EUR-05`) strictly filters payloads to ensure no PII enters.

### 5.2 Intermediary Autonomy
In accordance with `Rule ONB-02`, the Eurosystem does not perform KYC. The system accepts a cryptographic attestation from the PSP via `COMP-EUR-05` that KYC has been performed.

---

## Appendix: How to Parse This Specification

**For Automation Engineers:**

1.  **Set Discovery:**
    - Parse **Section 4 (Document Map)**.
    - Extract the `Global ID` and `Document` path for each row.
    - *Usage:* This allows your CI tools to dynamically discover all files belonging to `SPEC-SET-ONB` without hardcoding filenames.

2.  **Dependency Validation (Linting):**
    - Parse **Section 3.1** to find the `@rule` tag.
    - Check that this version matches the `version` field in `20-rulebook/manifest.yaml`.
    - Parse **Section 3.2** to find the `@arch` tag.
    - Check that this version matches the `version` field in `30-architecture/manifest.yaml`.
    - *Alert:* If versions mismatch, fail the build with `SpecDriftError`.

3.  **Traceability Auditing:**
    - Extract all **Rule IDs** (e.g., `ONB-01`) listed in the table in Section 3.1.
    - Scan `SPEC-OB-FUNC` and `SPEC-OB-INT`.
    - *Validation:* Warn if any Rule listed here is **not** referenced in the child specifications (indicating a missing requirement).

    