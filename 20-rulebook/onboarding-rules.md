---
artefact_type: rulebook
visibility: public
audience: 
  - PSP
  - NCB
  - VENDOR
form: text
role: rule
status: normative
owner: rulebook-development-group
---

# User Onboarding and Identity Rules

## Source Reference
**Draft Digital Euro Scheme Rulebook V0.9** — Section 3.5.2 (Access Management).

## Purpose
This document defines the rules for identifying users and establishing digital euro relationships. These rules determine the logic for the **Onboarding API** and **User Registry**.

---

## 1. Single Account Principle
**Rule ONB-01:** One User, One Account.
- **Rule AM-011-001:** An individual user can have only **one** digital euro account.
- The scheme ensures that the **Holding Limit** is enforced on this single identity.
- Users **CANNOT** hold active accounts with multiple Intermediaries simultaneously.

## 2. Onboarding Process
**Rule ONB-02:** Intermediary Responsibility.
- Onboarding MUST be performed by an authorized Intermediary.
- The Intermediary MUST perform KYC/AML checks in compliance with relevant EU regulations before a digital euro account is activated.

**Rule ONB-03:** Digital Euro Account Creation.
- Upon successful verification, the Intermediary provisions a **Digital Euro Account** (wallet).
- This account MUST be linked to the user's unique digital euro identifier.

## 3. Account Switching
**Rule ONB-04:** Switching (Not Multi-homing).
- Users have the right to **Switch** their account from one Intermediary to another.
- **Rule AM-011-004:** If a user attempts to onboard at a new Intermediary, they MUST be offered the option to **Switch** their existing account.
- The old account MUST be closed (offboarded) before the new one is fully activated.

## 4. Offboarding
**Rule ONB-05:** Termination.
- Users have the right to close their digital euro account at any time.
- Intermediaries MUST process offboarding by defunding any remaining balance to the user's commercial bank account before closure.

