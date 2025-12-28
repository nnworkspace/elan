---
artefact_type: specification
visibility: public
audience: everyone
form: text
role: specification
status: informative
owner: system-architecture
---

# Liquidity Reservation Specifications — Folder Map

This folder contains the **liquidity reservation specification set**.

Each file has a distinct role.
Together they form a complete, layered specification
governing how liquidity is reserved, consumed, and released
within the Digital Euro system.

---

## Files in this folder

### `liquidity-reservation-overview.md`
Provides **scope, intent, and context** for the liquidity reservation specifications.

This file explains:
- why liquidity reservation is required,
- what is in scope and out of scope,
- how the specifications relate to rulebooks and architecture.

---

### `liquidity-reservation-functional-spec.md`
Defines **what must happen** functionally.

- reservation purpose and scope
- lifecycle requirements
- invariants and failure conditions
- auditability requirements

This file expresses **functional intent**, independent of interfaces or data structures.

---

### `liquidity-reservation-interfaces-spec.md`
Defines **how system components interact**.

- roles of PSP Integration Layers, Access Gateway, and DESP
- interaction flows
- idempotency and authorisation rules
- error handling

This file constrains **behaviour and orchestration**, not API syntax.

---

### `liquidity-reservation-data-model-spec.md`
Defines the **logical data model** required to support liquidity reservation.

- liquidity sources
- reservation entities
- lifecycle state representation
- audit metadata

This file constrains **data shape and semantics**, without prescribing storage technology.

---

### `openapi.yaml`
Provides an **illustrative OpenAPI specification**.

- realises the interface specification as machine-readable APIs
- explicitly references the functional, interface, and data-model specs
- exists to demonstrate traceability and automation

---

## Relationship to downstream artefacts

Together, these specifications constrain:

- API definitions
- implementation code
- automated tests
- CI/CD validation rules
- audit and compliance evidence

No downstream artefact should contradict the specifications in this folder.


## Disclaimer

The specifications contained in this folder are **illustrative and educational**.

They are **not** official Digital Euro specifications and **do not represent**:
- an ECB position,
- a Eurosystem design decision,
- or any agreed technical implementation.

All content is derived from **publicly available information** (e.g. scheme rulebooks, policy documents) and from **reasonable technical assumptions** made solely for the purpose of demonstrating methodology, structure, and traceability.

No confidential, proprietary, or insider information is included.

These documents exist to show *how* complex institutional requirements **could be structured, governed, and automated** — not *what* the Digital Euro system will implement.

Readers should not interpret this material as normative or binding for any real Digital Euro project.



