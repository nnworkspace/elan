---
artefact_type: specification
visibility: public
audience: everyone
form: text
role: specification
status: normative
owner: system-architecture
---

# Participant Onboarding — Data Model Specification

## Purpose

This document defines the **logical data model** for participant onboarding used by the Digital Euro Service Platform (DESP).

It serves two purposes:
1.  **Human Reference:** A clear definition of what data exists and why.
2.  **Machine Contract:** A structured definition that can be parsed to validate API schemas (OpenAPI) and database definitions.

## 1. Design Principles

The following principles apply globally to the data model.

| ID | Principle | Requirement Statement | Trace |
| :--- | :--- | :--- | :--- |
| **DM-GEN-01** | **Minimal Authority** | DESP MUST store **only authoritative platform data**. It MUST NOT store real-world identities, customer KYC documents, or personal identifiers. | `RULE-PRIV-01` |
| **DM-GEN-02** | **Lifecycle-First** | All participant data MUST be attributable to a **well-defined lifecycle state** as defined in the Functional Spec. | `ONB-FUNC-02` |
| **DM-GEN-03** | **Immutability** | Once assigned, `participant_id` and `bic` MUST NOT be changed. | `ARCH-SEC-01` |

## 2. Data Dictionary

### 2.1 Entity: Participant
The `Participant` entity represents a legal institution (e.g., a PSP) interacting with the platform.

**Parsing Context:** `Scope: Participant`

| ID | Attribute | Type | Card. | Description / Constraint | Trace |
| :--- | :--- | :--- | :---: | :--- | :--- |
| `DAT-PAR-001` | **`participant_id`** | `UUID` | 1..1 | **Primary Key.** Internal platform identifier.<br>Format: UUIDv4. | `ARCH-ID-01` |
| `DAT-PAR-002` | **`bic`** | `String` | 1..1 | **Natural Key.** Business Identifier Code.<br>Regex: `^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$` | `ISO-9362` |
| `DAT-PAR-003` | **`legal_name`** | `String` | 1..1 | Registered legal name of the entity.<br>Max Length: 120 chars. | `RULE-ONB-01` |
| `DAT-PAR-004` | **`role`** | `Enum` | 1..1 | The operational role.<br>Values: `PSP`, `NCB`, `DISTRIBUTOR`. | `RULE-ACT-02` |
| `DAT-PAR-005` | **`lifecycle_state`** | `Enum` | 1..1 | Current state in the onboarding workflow.<br>Values: `DRAFT`, `SUBMITTED`, `VERIFIED`, `ACTIVE`, `SUSPENDED`. | `ONB-FUNC-01` |
| `DAT-PAR-006` | **`created_at`** | `Timestamp` | 1..1 | UTC timestamp of record creation.<br>Format: ISO-8601. | `AUDIT-01` |
| `DAT-PAR-007` | **`updated_at`** | `Timestamp` | 1..1 | UTC timestamp of last state change. | `AUDIT-01` |

### 2.2 Entity: OnboardingAuditLog
An append-only log of all state transitions for a participant.

**Parsing Context:** `Scope: AuditLog`

| ID | Attribute | Type | Card. | Description / Constraint | Trace |
| :--- | :--- | :--- | :---: | :--- | :--- |
| `DAT-LOG-001` | **`event_id`** | `UUID` | 1..1 | Unique event identifier. | `AUDIT-01` |
| `DAT-LOG-002` | **`participant_ref`** | `UUID` | 1..1 | Foreign Key to `Participant`. | `DAT-PAR-001` |
| `DAT-LOG-003` | **`transition`** | `String` | 1..1 | The transition executed.<br>Format: `OLD_STATE:NEW_STATE`. | `ONB-FUNC-03` |
| `DAT-LOG-004` | **`actor_ref`** | `String` | 1..1 | The system or user ID performing the action.<br>Must not be null. | `SEC-AUTH-01` |
| `DAT-LOG-005` | **`evidence_hash`** | `String` | 0..1 | SHA-256 hash of the supporting verification documents (not the docs themselves). | `DM-GEN-01` |

## 3. Data Mapping & Validation

This section provides normative mapping for implementers.

### 3.1 JSON Schema Mapping
For the purpose of API validation (OpenAPI), the Types defined above map as follows:

| Spec Type | JSON Type | Format / Pattern |
| :--- | :--- | :--- |
| `UUID` | `string` | `uuid` |
| `Timestamp` | `string` | `date-time` |
| `Enum` | `string` | (Restricted to allowed values) |

### 3.2 Confidentiality Rules

| Data Classification | Attributes | Handling Requirement |
| :--- | :--- | :--- |
| **Public** | `legal_name`, `role`, `bic` | May be exposed in Public Directories. |
| **Internal** | `participant_id`, `lifecycle_state` | Exposed only to authenticated PSPs. |
| **Restricted** | `actor_ref` | Visible only to Audit/Security teams. |

---

## Appendix: How to Parse This Specification

**For Automation Engineers:**
This document is structured to be parsed by the project's CI/CD `spec-linter`.

1.  **Extractor:** Look for Markdown tables immediately following an H3 header (`###`).
2.  **Identifier:** The first column `ID` is the primary key for the requirement.
3.  **Traceability:** The `Trace` column MUST resolve to a valid ID in the `20-rulebook`, `30-architecture` or `40-specifications` layer.
4.  **Validation:** The `Constraint` column contains machine-testable regex or value sets where applicable.

