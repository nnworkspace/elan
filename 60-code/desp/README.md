---
artefact_type: documentation
visibility: public
audience: everyone
form: text
role: component-guide
status: operative
owner: ecb
---

# Digital Euro Service Platform (DESP) - Core

> **Institution:** Eurosystem  
> **Component ID:** COMP-DESP-CORE  
> **Tech Stack:** Java 21 (Spring Boot)  

## Purpose and Responsibility
The **DESP Core** is the authoritative ledger for the Digital Euro. It is responsible for:
1.  **Token Issuance & Redemption:** Minting and burning tokens against central bank reserves.
2.  **Settlement:** Atomic transfer of value between wallet addresses.
3.  **Double-Spend Prevention:** Enforcing uniqueness of token usage (or UTXO consumption).

## Scope
### In Scope
* Core ledger logic (debit/credit validation).
* Cryptographic signature verification of transaction instructions.
* High-performance settlement APIs (gRPC).

### Out of Scope
* User identity management (handled by Onboarding / PSPs).
* Mobile app connectivity (handled by Access Gateways).
* Alias resolution (handled by Alias Service).

## Implemented Specifications
This component implements the following specifications. All code contributions must reference these IDs:

| Specification ID | Version | Description |
| :--- | :--- | :--- |
| **SPEC-LEDGER-001** | v1.2.0 | Core Settlement Logic & Ledger Invariants |
| **SPEC-TOKEN-050** | v1.0.0 | Token Lifecycle (Mint/Burn) Standards |

## Interaction Model
The DESP is a "headless" backend service. It does not accept connections from the public internet.

* **Upstream:** Receives instructions from **Access Gateways** (authorized PSP connections).
* **Downstream:** Queries the **Alias Service** to resolve IBANs/Phone numbers to wallet addresses.

## Developer Guide
This component uses **Java 21** and **Maven**.

### Traceability Mandate
All business logic classes MUST be annotated with `@SpecLink` to ensure traceability to the requirements above.


## Disclaimer

The code in this folder is **illustrative and educational**. It does not represent official implementations, production-ready components, or endorsed technical approaches for the Digital Euro or any other real-world system.
