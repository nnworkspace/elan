---
artefact_type: specification
visibility: public
audience: everyone
form: text
role: specification
status: normative
owner: system-architecture
---

# Liquidity Reservation — Functional Specification

## Purpose

This specification defines the **functional requirements** for liquidity reservation
within the Digital Euro system.

Liquidity reservation ensures that settlement operations are executed safely by:

- preventing over-commitment of available funds,
- providing deterministic settlement outcomes,
- enabling controlled release or consumption of reserved liquidity,
- supporting auditability and operational resilience.

This specification defines **what must happen**, independent of interfaces or data models.

---

## Normative context

This specification derives from:

- the Digital Euro scheme rulebook (prefunding and settlement safety principles),
- the system architecture (DESP and Access Gateway),
- general principles of payment system risk management.

It does not prescribe implementation technology or internal PSP processes.

---

## Functional objectives

### LR-G-01 — Settlement safety

The system MUST ensure that liquidity required for settlement
is available and reserved prior to execution.

---

### LR-G-02 — Non-overcommitment

The system MUST prevent the same unit of liquidity
from being reserved or consumed more than once.

---

### LR-G-03 — Deterministic outcomes

Given identical inputs and state,
liquidity reservation operations MUST produce deterministic results.

---

### LR-G-04 — Explicit lifecycle control

Liquidity reservations MUST transition through explicit, well-defined lifecycle states.

Implicit reservation, release, or consumption is prohibited.

---

## Scope of liquidity reservation

Liquidity reservation applies to:

- settlement operations requiring prefunding,
- batched or deferred settlement scenarios,
- operations where settlement finality depends on prior availability of funds.

It does NOT apply to:

- monetary issuance or redemption decisions,
- balance disclosure to end users,
- holding limit enforcement.

---

## Core concepts

### Liquidity source

A **liquidity source** represents a pool of funds
against which reservations can be made.

Examples include:
- prefunded settlement accounts,
- designated liquidity pools for a PSP or participant.

The internal structure of liquidity sources is out of scope.

---

### Reservation

A **liquidity reservation** represents a temporary, exclusive claim on a specified amount of liquidity from a given source.

A reservation does not move funds. It only constrains availability.

---

## Reservation lifecycle

> **Placeholder:**  
> The reservation lifecycle states and transitions are defined conceptually here
> and refined in the Interface and Data Model specifications.

At a minimum, the lifecycle includes:

- creation of a reservation request,
- confirmation of a successful reservation,
- consumption of reserved liquidity during settlement,
- release or expiry of unused reservations.

---

## Functional requirements

### LR-F-01 — Create reservation

The system MUST support explicit creation of a liquidity reservation for a specified amount and scope.

Creation MUST fail if sufficient unreserved liquidity is not available.

---

### LR-F-02 — Reservation exclusivity

Once created, a reservation MUST exclusively bind the specified amount
until it is either consumed, released, or expired.

---

### LR-F-03 — Consume reservation

The system MUST support explicit consumption of a reservation as part of a settlement operation.

Consumption MUST be irreversible.

---

### LR-F-04 — Release reservation

The system MUST support explicit release of a reservation when settlement does not occur.

Released liquidity MUST immediately become available again.

---

### LR-F-05 — Reservation expiry

The system MUST support time-bound reservations.

Expired reservations MUST be released automatically without requiring external intervention.

---

### LR-F-06 — Idempotency

Repeated submission of identical reservation, consumption,
or release requests MUST NOT result in duplicate side effects.

Conflicting reuse of identifiers MUST be rejected.

---

### LR-F-07 — Authorisation

Only authorised actors MAY:

- create reservations,
- consume reservations,
- release reservations.

Unauthorised attempts MUST be rejected.

---

## Error conditions

### LR-E-01 — Insufficient liquidity

Reservation creation MUST fail
if the requested amount exceeds available unreserved liquidity.

---

### LR-E-02 — Invalid lifecycle transition

Operations inconsistent with the current reservation state
MUST be rejected.

---

### LR-E-03 — Expired reservation

Attempts to consume or release an expired reservation
MUST be rejected.

---

## Auditability

All reservation-related operations MUST generate
audit-relevant events capturing:

- the type of operation,
- the affected reservation,
- the actor role,
- the timestamp,
- the outcome.

Audit records MUST NOT expose confidential or personal data.

---

## Relationship to downstream specifications

This functional specification constrains:

- the Interface Behaviour Specification,
- the Data Model Specification,
- API definitions,
- settlement logic and validation,
- automated tests and CI/CD checks.

Downstream artefacts MUST NOT contradict the requirements defined herein.

---

## Disclaimer

This specification is **illustrative**.

It demonstrates how liquidity reservation principles can be translated into functional system requirements, without asserting an official ECB or Eurosystem implementation.


