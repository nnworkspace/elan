---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: informative
owner: project-governance
---

# Élan

## The disciplined momentum of a system that knows why it moves

**Élan** is a demonstrative workbench for **Institutional Governance Engineering**.

Its purpose is not merely to deliver software, but to demonstrate how valid, auditable systems can be built in **high-stakes environments**.

While the structure handles the entropy of **large, complex, multi-stakeholder projects**, its principles apply wherever **integrity** is more critical than raw velocity.

It bridges the gap between **Policy Intent** and **Technical Production** by treating governance not as an external constraint, but as the foundational dependency of the codebase.

The Digital Euro project is used throughout this repository to **bring the workflow and methodology to life**. However, the structure and principles presented here are **domain-agnostic** and applicable to any large-scale project involving regulation, governance, multiple institutions, and long-lived systems.

_All references to the Digital Euro project in this repository are derived solely from publicly available sources, such as published legislative drafts, official communications, and openly accessible documentation. This repository does not contain, and does not rely upon, any confidential, restricted, or non-public information._



## Why this repository exists

Institutional IT projects often struggle not because of a lack of expertise, but because:

- policy intent is separated from technical implementation
- legislative and regulatory constraints are detached from engineering reality
- requirements are implicit rather than explicit
- code evolves faster than shared understanding

This repository demonstrates an alternative approach:

> **Every artefact — from policy text to source code and delivery — is explicit, versioned, classified, and traceable.**

Governance is enforced mechanically through automation, not informally through process documents.



## The workbench as a shared environment

This repository treats a Git-based platform such as GitHub or GitLab as the **shared workbench** of a complex institutional project.

Its value lies not only in automation, but in the way it brings together artefacts, discussion, review, decisions, and delivery in a single, versioned environment. Issues, merge requests, comments, and reviews are treated as **first-class project artefacts**, preserving context and rationale alongside the documents and code they shape.

In this sense, the repository **is**:

- a Markdown-first, Git-based reference structure  
- an educational template for policy-to-production traceability  
- a demonstration of how automation enforces governance discipline  
- a shared environment readable across disciplines — legal, technical, operational, and managerial  

And it **is not**:

- a production-ready system  
- a full implementation of the Digital Euro  
- a substitute for legal, regulatory, or procurement processes  

Those boundaries are intentional. This repository focuses on what follows intent and procurement: how diverse builders work together over time without losing semantic integrity.

By treating communication, coordination, and delivery as part of the same workbench, the project supports:

- transparency across disciplines  
- durable traceability of decisions  
- shared understanding between builders  
- standardisation without rigidity  

Conventions governing communication and project coordination are documented in:

- [`00-project-governance/communication-and-project-management.md`](00-project-governance/communication-and-project-management.md)

A detailed explanation of how this workbench maintains coherence across distributed repositories, registries, and visibility boundaries is provided in:

- [`00-project-governance/logical-system-and-visibility.md`](00-project-governance/logical-system-and-visibility.md)

This is not documentation theatre. It is an attempt to show how a unified workbench can support durable, auditable systems in the digital age.



## How to use this repository

This repository is designed to be **used**, not merely read.

You are encouraged to **clone or fork it as a template**, and to adapt the structure to the needs of your own project.

> **Tip:** The intended way to start is via GitHub’s **"Use this template"** feature, which generates a clean repository history for your new project.

The folder layout, classification model, and automation rules are intentionally explicit so that they can be reshaped without losing coherence.

In practice, this means:

- reorganising or extending layers to reflect your domain  
- renaming folders to match your institutional language  
- replacing illustrative artefacts with your own policy texts, specifications, and code  
- adjusting automation rules as organisational maturity grows  

The structure presented here is not prescriptive; it is **scaffolded**. Its purpose is to help diverse contributors — legal, technical, operational — work within a shared semantic frame.

In real institutional projects, artefacts will often be **physically distributed** across multiple repositories and registries due to visibility, contractual, or security constraints. Public rulebooks, restricted specifications, confidential implementations, and binary deliveries may therefore live in different locations.

This repository demonstrates how such a system can remain **logically unified**, even when physically distributed, through explicit classification and automated enforcement.

For projects with **sovereignty, regulatory, or security constraints**, this repository should be hosted accordingly. While GitHub is convenient, many institutional projects will prefer:

- a European-hosted GitLab service, or  
- a self-managed GitLab instance deployed on sovereign infrastructure  

The tooling choice matters less than the principle:  
**the workbench must belong to the builders.**




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

### Procurement and vendor engagement (scope note)

Large institutional projects are, in practice, also procurement projects.

Public tenders, technical requirements, evaluation criteria, contracts, and vendor agreements play a decisive role in shaping delivery. These processes are often governed by strict legal frameworks, and many of the resulting artefacts — particularly evaluations, commercial terms, and contractual details — are inherently confidential.

This repository does not attempt to simulate procurement processes or tender documentation. That omission is deliberate.

The purpose of this repository is to focus on what follows procurement: how policy intent, requirements, implementation, testing, and delivery are governed over time once multiple internal and external actors begin to build together.

In real projects, procurement artefacts would typically reside in separate systems or repositories with appropriate access control, and would be linked to the technical workbench through explicit references and contractual obligations.

By keeping procurement out of scope here, the repository remains focused on its primary objective: demonstrating how automation, traceability, and a shared workbench preserve institutional intent throughout implementation and operation.



## Artefact classification and visibility

All artefacts in this repository are classified according to an explicit **Artefact Classification Model**.

Each artefact declares:

- its visibility (PUBLIC, RESTRICTED, CONFIDENTIAL)
- its intended audience
- its delivery form (text, source, binary, service)
- its role in the policy-to-production chain

See:

- [`00-project-governance/artefact-classification.md`](00-project-governance/artefact-classification.md)

Classification is not advisory. It is enforced by automation.



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

- [`00-project-governance/linting-rules.md`](00-project-governance/linting-rules.md)


CI/CD is the quiet authority of the system — the continuous translation of intention into discipline, and of discipline into trust.

## Repository structure (conceptual)

```text
policy-to-production/
├── 00-project-governance/        # Project governance: rules, conventions, communication, glossary, timelines
├── 10-legal-framework/           # Policy and legal context
├── 20-rulebook/                  # Scheme rules and operational obligations
├── 30-architecture/              # High-level system design
├── 40-specifications/            # Technical specifications
├── 50-tests/                     # Acceptance criteria and evidence
├── 60-code/                      # Illustrative implementations
├── 70-reports/                   # Automatically generated reports (e.g. progress summaries, compliance views)
├── 80-automation/                # Active Governance: Pipelines, Analysis, and AI Oracle
├── README.md
└── LICENSE

```

Each directory represents a **layer of intent**, ordered deliberately from abstract mandate to concrete delivery.

The numeric prefixes make the progression explicit and discourage accidental inversion (for example, writing code before mandate or tests before specification).



## Relationship to restricted and confidential artefacts

Some artefacts — particularly those related to security-sensitive components, platform integrations, or vendor-specific implementations — **cannot be public by design**.

In this repository, such artefacts are represented by:

- manifests
- interface descriptions
- metadata
- explicit placeholders

The actual content would live in separate repositories or registries with appropriate access control.

This makes constraints visible **without violating them**.


## Intended audience

### A note on risk profile

**Élan is not defined by the size of the project, but by the cost of failure.**

It is designed for projects that **cannot afford to lack confidence**.

Whether you are a team of 5 building a medical device, or a consortium of 500 building a currency, the requirement is the same: you must be able to prove that what you built matches what you intended. If "move fast and break things" is not an option for you, then Élan is your workbench.

### Roles

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

## How to read this repository

This repository is not meant to be consumed linearly.

Its value emerges when artefacts are viewed **in relation to one another:** when a rulebook can be read alongside a specification, a test alongside a policy decision, and a deployment step alongside its original mandate.

Readers are encouraged to:

- move freely between layers
- follow references rather than sections
- observe how intent is preserved — or lost — as systems become concrete

The repository is organised so that abstraction gradually gives way to implementation, but no layer stands alone. Understanding arises from **co-presence**, not sequence.

This mirrors the reality of institutional projects: progress depends less on perfect documents than on a shared, versioned environment in which intent can survive contact with reality.


### Why does this look like a Node.js project?

You may notice a `package.json` file and a `node_modules` folder in this repository.

These do **not** imply that the project itself is a Node.js application, nor that the Digital Euro is built on JavaScript.

This infrastructure exists solely to support **mechanical governance**. We use standard engineering tools (`commitlint`, `husky`) to enforce the [Commit Message Conventions](00-project-governance/commit-message-conventions.md) defined in our governance corpus. This ensures that even the act of saving a change is subject to the same rigour as the change itself.

#### How to enable the governance tools

To enable these checks on your local machine, run:

```bash
npm install
```

(Or `pnpm install` / `yarn install` if you prefer).
This installs the pre-commit hooks. Once installed, any attempt to commit will be automatically checked against the governance rules.



## Status

This repository is a **living educational reference**.

Its value lies in structure, clarity, and discipline — not completeness.

## Community & Discussion

Governance is a conversation, not a monologue. We invite you to share your ideas, challenges, and adaptations.

👉 **[Join the Discussion on GitHub](https://github.com/nnworkspace/elan/discussions)**


## Licence

This repository is published for educational and demonstrative purposes.

No warranty is provided.
