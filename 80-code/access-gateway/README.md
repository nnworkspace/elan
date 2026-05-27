---
artefact_type: code
visibility: restricted
audience:
  - ECB
  - PSP
form: text
role: implementation
status: normative
owner: NCB
---

<!-- 
DISCLAIMER:
The code in this folder is **illustrative and educational**.
It does not represent official implementations, production-ready components,
or endorsed technical approaches for the Digital Euro or any other real-world system.

PURPOSE:
This component serves as a reference implementation to demonstrate how technical
specifications are refined into code while maintaining strict auditability,
traceability, and mechanical governance across distinct institutional boundaries.
This structure enables automated compliance verification and live impact analysis.
-->

# Digital Euro Access Gateway

**Component ID:** `COMP-EUR-05`  
**Owner:** National Central Banks (Delegated Operation)  
**Stack:** Go 1.21

## Overview
The Access Gateway is the **Shield of the Platform**. It is the only component reachable by Intermediaries (PSPs).

## Responsibilities
1.  **Authentication**: Verifies mTLS QWACs (Qualified Website Authentication Certificates).
2.  **Firewalling**: Rejects requests containing disallowed fields (Privacy Firewall).
3.  **Routing**: Routes valid traffic to `desp` (Core) or `alias-service`.

## Architecture
This component is designed as a high-concurrency **Edge Proxy**.
It implements the `I_PSP_Gateway` interface defined in `SPEC-API-GW`.

## Traceability
*   `SPEC-SEC-OPS`: Firewall Rules
*   `SPEC-API-GW`: REST Contract
