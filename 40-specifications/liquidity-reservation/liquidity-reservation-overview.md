---
artefact_type: specification
visibility: public
audience: everyone
form: text
role: specification
status: informative
owner: system-architecture
---

# Liquidity Reservation — Specification Overview

## Purpose

This specification set defines the **liquidity reservation model** used to support
safe, predictable settlement within the Digital Euro system.

Liquidity reservation is a **risk-containment mechanism**.
It ensures that payment and settlement operations do not over-commit available funds
and that value movements remain orderly, auditable, and reversible where required.

This overview explains the **scope, intent, and structure** of the liquidity reservation specifications.

---

## Normative context

The Digital Euro scheme rulebook defines:

- obligations around prefunding and settlement safety,
- roles and responsibilities of participants,
- high-level principles for liquidity availability and risk mitigation.

However, the rulebook does **not** prescribe a concrete technical model
for how liquidity is reserved, released, or consumed.

This specification set provides a **technical realisation** of those principles,
without asserting an official ECB or Eurosystem implementation.

---

## Scope

These specifications address:

- reservation of liquidity prior to settlement,
- lifecycle management of reservations,
- enforcement of non-overcommitment invariants,
- interaction patterns between intermediaries and the Eurosystem platform,
- authoritative data required to support reservation, consumption, and release.

They do **not** define:

- monetary policy,
- holding limits,
- end-user balance visibility,
- pricing, fees, or interest,
- or any political or distributional choices.

---

## Architectural context

The specifications are written against the **Digital Euro Service Platform (DESP)** architecture
and its canonical **Digital Euro Access Gateway**.

They assume an intermediated model in which:

- PSPs manage customer-facing interactions and initiate reservation requests,
- authoritative liquidity state is maintained within DESP,
- all platform interactions occur via the Access Gateway.

PSP internal systems are **out of scope** and intentionally not standardised.

---

## Specification set structure

The liquidity reservation specification set is layered and complementary.

Each file addresses a distinct concern:

- **Functional intent** (what must happen),
- **Interface behaviour** (how components interact),
- **Data model** (what must be stored authoritatively).

Together, they provide a complete and testable specification.

---

## Relationship to downstream artefacts

These specifications constrain and inform:

- API definitions (e.g. OpenAPI),
- settlement and reservation logic,
- automated tests and simulations,
- CI/CD validation rules,
- audit and compliance evidence.

Downstream artefacts MUST remain consistent with the specifications in this folder.

---

## Disclaimer

This specification set is **illustrative and educational**.

It does **not** represent:
- an official ECB position,
- a Eurosystem design decision,
- or an agreed Digital Euro technical standard.

All content is derived from publicly available information and from reasonable technical assumptions made solely to demonstrate methodology, structure, and traceability.

No confidential, proprietary, or insider information is included.


