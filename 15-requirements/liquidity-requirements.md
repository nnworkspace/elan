---
artefact_type: requirements
visibility: public
audience:
  - PSP
  - VENDOR
form: text
role: requirement
status: normative
owner: requirements-and-design
---

# Liquidity Management , Functional Requirements

## Source Reference
**Draft Digital Euro Scheme Rulebook V0.9** , Section 3.5.3 (Liquidity management) and Annex B2 (End-to-end flows).

## Purpose
This document captures **what liquidity management must achieve** from the user's perspective: keeping a user's digital euro balance usable for payments and within the holding limit, with funding and defunding from and to a linked non-digital-euro payment account. It is the upstream input that the rulebook codifies into the binding liquidity rules (`20-rulebook/liquidity-and-waterfall.md`, rules `LIQ-*`).

---

## 1. User journey , keeping a balance usable

From the user's perspective, the digital euro should "just work" for payments: enough balance when paying, no balance above the permitted limit, and money moving to and from the linked commercial-bank account without friction. Funding and defunding should be available 24 hours a day, every day of the year, manually or automatically.

## 2. Functional requirements

- **REQ-LIQ-01 , Funding and defunding at par.** A user can convert commercial bank money (or cash) into digital euro (**funding**) and back (**defunding**), at a 1:1 par conversion, available 24/7.
- **REQ-LIQ-02 , Manual or automated.** Funding and defunding can be performed manually, or automatically at a pre-defined time or on the breach of a user-defined threshold.
- **REQ-LIQ-03 , Reverse waterfall (automated funding).** If a user attempts a payment exceeding their digital euro balance, the system may automatically pull the shortfall from the linked account so the payment completes. This requires the user's prior consent and must appear to the user as a single, atomic transaction.
- **REQ-LIQ-04 , Waterfall (automated defunding).** If an incoming payment would take a user's balance above their **holding limit**, the excess is automatically defunded to the linked account.
- **REQ-LIQ-05 , Holding limit.** A holding limit applies per natural person. Incoming payments that would breach it, with no waterfall configured, are rejected. Business users (merchants) typically have a holding limit of zero, so received funds are immediately defunded.

## Downstream , how the rulebook codifies this

These requirements are made binding by the liquidity rules in [`20-rulebook/liquidity-and-waterfall.md`](../20-rulebook/liquidity-and-waterfall.md):

- REQ-LIQ-03 → `LIQ-01` (reverse waterfall, consent, atomicity).
- REQ-LIQ-04 → `LIQ-02` (waterfall on holding-limit breach).
- REQ-LIQ-05 → `LIQ-03` (zero-holding merchants) and `LIQ-04` (holding-limit enforcement).
