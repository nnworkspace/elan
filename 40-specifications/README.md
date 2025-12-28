---
artefact_type: specification
visibility: public
audience: everyone
form: text
role: specification
status: informative
owner: system-architecture
---

# Specifications

This folder contains **technical specifications** that translate intent — expressed in policy, legislation, and rulebooks — into forms that can be **implemented, tested, governed, and audited**.

In complex institutional projects, specifications play a unique and irreplaceable role. They are not an administrative burden; they are the **load-bearing structure** between ambition and execution.

## Why specifications matter

Large public-sector and multi-stakeholder projects bring together many kinds of builders:

- lawyers and policy authors,
- architects and engineers,
- procurement and vendor managers,
- auditors and risk officers,
- executives accountable for outcomes.

Each group works with different tools, languages, and time horizons.

Specifications provide the **shared technical language** that allows these groups to work together without losing meaning over time.

They make intent durable.

## Specifications are not tickets

Project management tools — issues, tickets, boards — are suitable for **coordination and flow**.

They are poor places to encode **normative intent**.

Tickets are transient, conversational, fragmented, optimised for throughput, not meaning.

Specifications, by contrast, are deliberate, structured, reviewable as wholes, stable over time.

In serious systems, tickets may *reference* specifications, but they should never *replace* them.

## Specifications serve different audiences

A well-written specification can be read differently by different readers:

- **Executives** see scope, boundaries, and risk containment.
- **Architects** see structure, responsibilities, and invariants.
- **Engineers** see constraints they can implement and test against.
- **Auditors** see traceability and intent made explicit.

This does not require separate documents. It requires **clarity of structure and discipline of language**.

## There is no single “right” way to write a specification

There is no universal standard for how technical specifications must be written. Many high-quality systems use very different styles, levels of formality, and structures.

A good example is the European Commission’s work on the EU Digital Identity Wallet. Its technical specifications are published here:

https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications

These documents are deliberately **heavy, formal, and institutional**. They are designed to support regulatory alignment, cross-border interoperability, and long-term legal certainty across Member States. They are excellent specifications — but they serve a very specific context and purpose.

The specifications in this repository take a different approach. They are intentionally lighter, more modular, and closer to downstream automation, in order to demonstrate traceability, CI/CD integration, and end-to-end governance.

Neither approach is inherently superior.

What matters is not *which* style you adopt, but whether your specifications:
- make intent explicit,
- separate concerns clearly,
- support implementation, testing, and audit,
- can evolve without collapsing,
- and fit the organisational, legal, and technical reality of your project.

Readers are encouraged to exercise **their own judgement** and to design specification practices that are appropriate to their domain, stakeholders, and constraints.

## Modern specifications are for humans *and* machines

In contemporary institutional systems, specifications should not exist only to be read.

They should also be **consumable by automation**.

This enables:

- consistency checks,
- traceability enforcement,
- test generation,
- audit support,
- CI/CD integration.

There are many ways to achieve this:

- template-based automation,
- schema-driven tooling,
- rule engines,
- or emerging AI-assisted techniques.

The common prerequisite is always the same:

> **A specification must be well structured — in content and in form.**

Without structure, no amount of tooling will help.

## How to read the specifications in this repository

Specifications in this folder are typically organised into **small, coherent sets**, each addressing a concrete domain or process (e.g. onboarding, liquidity reservation).

Within a set, documents are layered:

1. **Overview** — scope, intent, and context  
2. **Functional specification** — what must happen  
3. **Interface specification** — how components interact  
4. **Data model specification** — what must be stored and why  

This separation is intentional. It allows different concerns to evolve without entanglement.

## A final note

Civilisations do not fail because they lack ambition. They fail when intent cannot survive the journey from vision to execution.

Specifications exist to ensure that this journey remains intelligible.

This folder is a small attempt to show how that might be done — carefully, xplicitly, and with respect for the craft.


## ⚠️ Legal notice: Illustrative and non-authoritative content

**Important:** The technical specifications contained in this folder are **illustrative** and **non-authoritative**.

At the time of writing, the European Central Bank (ECB) has not published detailed open technical specifications or OpenAPI definitions for Digital Euro back-end interfaces.

The documents provided here have been created solely to **demonstrate a methodology** for structuring, governing, and automating technical specifications in a complex institutional project.  

While they reference publicly known concepts (such as the intermediated model), the specific API endpoints, data models, workflows, and attribute names are **hypothetical and invented by the author**.

These specifications are intended for **educational and illustrative purposes only** and **must not be treated as a basis for implementing any real Digital Euro systems**.

