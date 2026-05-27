---
artefact_type: code
visibility: public
audience:
  - PSP
  - NCB
form: text
role: implementation
status: normative
owner: External PSP
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

# Payment Service Provider (Mock)

**Component ID:** `COMP-PSP-01`  
**Owner:** External PSP (Example)  
**Stack:** Node.js / TypeScript / Express

## Overview
This component simulates a Payment Service Provider (PSP) that connects to the Eurosystem via the Access Gateway. It allows for the simulation of end-user interactions, including:
- Onboarding Users
- Funding Digital Euro Wallets
- Initiating Payments

## Governance
This component uses `governance-common-nodejs` to ensure strict traceability of implementation code to specifications.
