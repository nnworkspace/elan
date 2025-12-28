---
artefact_type: specification
visibility: public
audience: everyone
form: text
role: specification
status: normative
owner: system-architecture
---

# Liquidity Reservation — Data Model Specification

## Purpose

This document defines the **logical data model** required to support
liquidity reservation within the Digital Euro Service Platform (DESP).

It specifies the **minimum authoritative data** necessary to:

- enforce non-overcommitment of liquidity,
- support reservation lifecycle management,
- enable deterministic settlement behaviour,
- provide auditability without exposing sensitive information.

This data model is **illustrative** and does not represent an official ECB schema.

---

## Normative context

This specification derives from:

- Liquidity Reservation — Functional Specification  
- Liquidity Reservation — Interface Behaviour Specification  
- System Architecture — Component Inventory  

Where the scheme rulebook is silent, conservative and
risk-minimising assumptions are applied.

---

## Design principles

### LR-DM-01 — Authoritative minimalism

DESP stores **only authoritative reservation and liquidity data**.

It MUST NOT store:
- end-user identities,
- PSP internal balances,
- customer-level transaction context.

---

### LR-DM-02 — Lifecycle-driven modelling

All reservation data MUST be attributable
to an explicit lifecycle state.

Implicit or inferred states are prohibited.

---

### LR-DM-03 — Separation of liquidity and reservation

The model separates:

- **liquidity sources** (capacity),
- **reservations** (temporary claims),
- **audit events** (history).

This separation enables correctness, auditability, and extensibility.

---

## Core entities

### Liquidity source

A **Liquidity Source** represents a pool of funds
from which liquidity may be reserved.

This entity is authoritative but abstract.

| Field | Type | Description |
|------|------|-------------|
| `liquidity_source_id` | String | Unique identifier |
| `owner_id` | String | Participant or PSP reference |
| `currency` | String | Currency code (e.g. EUR) |
| `total_amount` | Decimal | Total available liquidity |
| `reserved_amount` | Decimal | Amount currently reserved |
| `updated_at` | Timestamp | Last update time |

> **Note:**  
> Available liquidity is derived as  
> `total_amount - reserved_amount`.

---

### Liquidity reservation

A **Liquidity Reservation** represents an exclusive,
time-bound claim on a portion of a liquidity source.

---

#### Liquidity reservation entity

| Field | Type | Description |
|------|------|-------------|
| `reservation_id` | String | Globally unique identifier |
| `liquidity_source_id` | String | Referenced liquidity source |
| `amount` | Decimal | Reserved amount |
| `state` | Enum | Current reservation lifecycle state |
| `created_at` | Timestamp | Reservation creation time |
| `expires_at` | Timestamp | Reservation expiry time |
| `updated_at` | Timestamp | Last state change |
| `version` | Integer | Optimistic concurrency / audit version |

---

## Reservation lifecycle

> **Placeholder:**  
> Reservation lifecycle states and transitions
> are defined in the Functional and Interface specifications.

This data model references those definitions
but does not redefine them here.

---

## Reservation invariants

The following invariants MUST always hold:

- A reservation amount MUST NOT exceed available liquidity.
- A reservation MUST bind liquidity exclusively while active.
- Reserved liquidity MUST NOT be double-counted.
- Consumed reservations MUST NOT be released.
- Expired reservations MUST NOT be consumed.

Violations MUST be prevented by design.

---

## Audit metadata

### Purpose

Audit metadata ensures that reservation behaviour
is **transparent and reconstructable** without exposing sensitive data.

---

### Audit event

| Field | Type | Description |
|------|------|-------------|
| `event_id` | String | Unique audit event identifier |
| `reservation_id` | String | Affected reservation |
| `event_type` | Enum | CREATE, CONSUME, RELEASE, EXPIRE |
| `performed_by` | String | Actor role or system component |
| `performed_at` | Timestamp | Event timestamp |
| `source` | String | Access Gateway / DESP |

Audit events are **append-only**.

---

## Privacy considerations

- Liquidity and reservation identifiers are opaque.
- No personal data is stored in DESP.
- PSP internal accounting details remain out of scope.

This aligns with privacy-by-design principles
and the intermediated model of the Digital Euro.

---

## Mapping to downstream artefacts

This data model constrains:

- database schemas (illustrative),
- API payloads,
- reservation validation logic,
- settlement orchestration,
- automated tests and CI/CD checks.

Downstream artefacts MUST remain consistent with this model.

---

## Disclaimer

This data model is **illustrative**.

It demonstrates how liquidity reservation requirements can be realised in a coherent, auditable data model, without asserting an official ECB or Eurosystem implementation.


