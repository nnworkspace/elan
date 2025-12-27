# policy-to-production

## From policy intent to running systems — with discipline

This repository is a **demonstrative reference project**.

Its purpose is not to deliver a runnable system, but to show **how large, complex, multi-stakeholder institutional IT projects can be organised end-to-end** in a way that is auditable, comprehensible, and sustainable.

The Digital Euro project is used throughout this repository to **bring the workflow and methodology to life**. However, the structure and principles presented here are **domain-agnostic** and applicable to any large-scale project involving regulation, governance, multiple institutions, and long-lived systems.

_All references to the Digital Euro project in this repository are derived solely from publicly available sources, such as published legislative drafts, official communications, and openly accessible documentation. This repository does not contain, and does not rely upon, any confidential, restricted, or non-public information._

---

## Why this repository exists

Institutional IT projects often struggle not because of a lack of expertise, but because:

- policy intent is separated from technical implementation
- legislative and regulatory constraints are detached from engineering reality
- requirements are implicit rather than explicit
- code evolves faster than shared understanding

This repository demonstrates an alternative approach:

> **Every artefact — from policy text to source code and delivery — is explicit, versioned, classified, and traceable.**

Governance is enforced mechanically through automation, not informally through process documents.

---

## What this repository is (and is not)

### This repository **is**

- a Markdown-first, Git-based reference structure
- an educational template for policy-to-production traceability
- a demonstration of how automation enforces governance discipline
- readable by engineers, architects, auditors, managers, and executives

### This repository **is not**

- a production-ready system
- a full implementation of the Digital Euro
- a replacement for legal, regulatory, or procurement processes

---

## How to use this repository

This repository is designed to be **used**, not merely read.

You are encouraged to **clone or fork it as a template**, and to adapt the structure to the needs of your own project. The folder layout, classification model, and automation rules are intentionally explicit so that they can be reshaped without losing coherence.

In practice, this means:

- Reorganising or extending folders to reflect your domain
- Renaming layers to match your institutional language
- Replacing illustrative artefacts with your own policy texts, specifications, and code
- Gradually tightening or relaxing automation rules as maturity grows

The structure presented here is not prescriptive; it is **scaffolded**. Its purpose is to help diverse contributors — legal, technical, operational — work within a shared semantic frame.

For projects with **sovereignty, regulatory, or security constraints**, this repository should be hosted accordingly. While GitHub is convenient, many institutional projects will prefer:

- a European-hosted GitLab service, or
- a self-managed GitLab instance deployed on sovereign infrastructure

The tooling choice matters less than the principle:
**the workbench must belong to the builders.**

What matters is that all artefacts — rulebooks, specifications, code, tests, and delivery pipelines — live side by side, versioned together, and governed by automation rather than informal process.

This repository demonstrates how such a workbench can be organised.

---

## A note on scope and realism

To support learning, **all artefacts are presented within a single repository using folders**.

This is a **didactic choice**.

In real-world projects, artefacts with different visibility or contractual constraints **must not** live in the same repository.

GitHub and GitLab provide access control at the repository level, not at the file level. As a result:

- PUBLIC artefacts should live in public repositories
- RESTRICTED artefacts should live in access-controlled repositories
- CONFIDENTIAL artefacts should live in NDA-bound repositories

In practice, teams should **promote the folder structure shown here into multiple repositories**, each with appropriate access control.

This repository demonstrates *how to organise the work* — not how to bypass security or contractual boundaries.

---

## Artefact classification and visibility

All artefacts in this repository are classified according to an explicit **Artefact Classification Model**.

Each artefact declares:

- its visibility (PUBLIC, RESTRICTED, CONFIDENTIAL)
- its intended audience
- its delivery form (text, source, binary, service)
- its role in the policy-to-production chain

See:

- `docs/artefact-classification.md`

Classification is not advisory. It is enforced by automation.

---

## Traceability and automation

Traceability is enforced end-to-end:

- policy and legal artefacts anchor requirements
- specifications derive from explicit mandates
- implementations reference specifications
- tests validate specifications
- delivery artefacts are justified and auditable

Automation replaces manual policing:

- linting validates classification and references
- CI enforces governance rules
- violations fail fast and visibly

See:

- `docs/linting-rules.md`

---

## Repository structure (conceptual)

```
policy-to-production/
├── 00-docs/                    # Governance, conventions, classification, glossary
├── 01-stakeholders/            # Institutions, roles, responsibilities
├── 02-legislative-framework/   # Policy and legal context
├── 03-rulebook/                # Scheme rules, obligations, governance
├── 04-architecture/            # High-level system design
├── 05-specifications/          # Technical specifications
├── 06-code/                    # Illustrative implementations
├── 07-tests/                   # Acceptance criteria and evidence
├── 08-ci-cd/                   # Pipeline and deployment concepts
├── README.md
└── LICENSE
```

Each directory represents a **layer of intent**, ordered deliberately from abstract mandate to concrete delivery.

The numeric prefixes make the progression explicit and discourage accidental inversion (for example, writing code before mandate or tests before specification).

---

## Relationship to restricted and confidential artefacts

Some artefacts — particularly those related to security-sensitive components, platform integrations, or vendor-specific implementations — **cannot be public by design**.

In this repository, such artefacts are represented by:

- manifests
- interface descriptions
- metadata
- explicit placeholders

The actual content would live in separate repositories with appropriate access control.

This makes constraints visible **without violating them**.

---

## Relationship to `policy-to-production-doorstop`

This repository represents the **flexible, tool-light** approach.

For teams at an earlier stage of maturity, see:

👉 [**`policy-to-production-doorstop`**](https://github.com/nnworkspace/policy-to-production-doorstop)

That repository uses an opinionated requirements framework to reduce degrees of freedom and provide additional guidance.

A typical progression is:

1. Start with DoorStop (guided discipline)
2. Graduate to this repository (earned flexibility)

---

## Intended audience

This repository is written for **builders**.

By builders, we do not mean engineers alone. We mean everyone whose work contributes to the construction of a complex digital system:

- lawyers and policy authors who define intent
- economists and domain experts who shape constraints
- procurement and governance specialists who structure delivery
- architects and engineers who translate intent into systems
- auditors and reviewers who must later reconstruct decisions

Its premise is simple:
**no durable system can be built if its builders do not share a single source of truth.**

The repository is therefore designed to be intelligible across disciplines, without diluting technical precision or institutional responsibility.

---

## How to read this repository

This repository is not meant to be consumed linearly.

Its value emerges when artefacts are viewed **in relation to one another:** when a rulebook can be read alongside a specification, a test alongside a policy decision, and a deployment step alongside its original mandate.

Readers are encouraged to:

- move freely between layers
- follow references rather than sections
- observe how intent is preserved — or lost — as systems become concrete

The repository is organised so that abstraction gradually gives way to implementation, but no layer stands alone. Understanding arises from **co-presence**, not sequence.

This mirrors the reality of institutional projects: progress depends less on perfect documents than on a shared, versioned environment in which intent can survive contact with reality.

---

## Status

This repository is a **living educational reference**.

Its value lies in structure, clarity, and discipline — not completeness.

---

## Licence

This repository is published for educational and demonstrative purposes.

No warranty is provided.
