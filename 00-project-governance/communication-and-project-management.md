---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: project-governance
---

# Communication and Project Management

## Purpose

This document defines the governance conventions for **communication, coordination, and project management** within this repository.

The guiding principle is simple:

> **Communication is part of the system, not an external activity.**

Discussions, decisions, and coordination are treated as first‑class artefacts and are preserved alongside the documents and code they influence.

---

## The shared workbench

This project assumes a Git‑based platform such as **GitLab** or **GitHub** as the shared workbench.

While automation and CI/CD are essential, they are not sufficient on their own. A durable institutional system also requires:

* traceable discussion
* visible decision‑making
* coordinated change
* a persistent project memory

Issues, discussions, merge requests, reviews, and commit histories together form the living record of the project.

---

## Issues as the primary coordination mechanism

### Role of issues

Issues are the **primary unit of coordination**.

They are used to:

* introduce requirements
* discuss interpretations of policy or rulebook text
* track design decisions
* plan implementation work
* record questions, risks, and constraints

All substantive work begins with, or is linked to, an issue.

### Issue lifecycle

A typical issue lifecycle is:

1. Issue opened with clear intent and context
2. Discussion and clarification
3. Agreement on approach or decision
4. Implementation via commits or merge requests
5. Closure with references to resulting artefacts

Issues are not merely task trackers; they are **records of reasoning**.

### Issue templates and labels

#### Purpose

Well-designed issue templates and labels reduce communication friction, improve clarity across disciplines, and establish a shared vocabulary for coordination.

Rather than relying on individual writing styles or informal conventions, this project treats templates and labels as **governance instruments**.

#### Issue templates

Issue templates provide structured prompts that help contributors articulate intent clearly and consistently.

Templates should be used to:

- distinguish between different kinds of work (e.g. requirement, clarification, implementation, risk)
- ensure that relevant context is always provided
- reduce back-and-forth clarification
- make issues intelligible across disciplines

A small number of well-curated templates is preferable to a large collection.

This repository may include example templates under:

[`00-project-governance/issue-templates/`](./issue-templates/)

These examples are illustrative and can be adapted or extended by teams to fit their own needs.

#### Labels

Labels provide a lightweight, machine-readable way to classify issues and track work at a higher level.

Labels should be:
- few in number
- clearly defined
- applied consistently

Typical label dimensions include:

- **Type** (e.g. requirement, specification, implementation, test, governance)
- **Status** (e.g. proposed, agreed, blocked)
- **Impact** (e.g. breaking, non-breaking)
- **Visibility** (e.g. public, restricted)

Labels complement, but do not replace, explicit classification within artefacts.


#### Governance of templates and labels

Templates and labels are part of the project’s governance layer.

Changes to them should be:

- deliberate
- reviewed
- documented

Their purpose is not to constrain thought, but to make collaboration easier and more precise.

---

## Discussions

Where a topic is exploratory, conceptual, or cross‑cutting, **Discussions** (or their GitLab equivalent) should be used instead of issues.

Discussions are appropriate for:

* early architectural exploration
* governance questions
* cross‑disciplinary clarification
* lessons learned and retrospectives

When a discussion results in actionable work, a corresponding issue should be created and linked.

---

## Commits and traceability

### Commit–issue linkage

Every commit **must reference one or more issues**.

This ensures that:

* no change exists without context
* intent can be reconstructed later
* audits can trace changes back to discussion and decision

Commits without issue references are rejected.

---

### Commit message discipline

All commits must follow a strict commit message convention enforced by automated tooling (e.g. `commitlint`).

A typical commit message structure is:

```
<type>(<scope>): <short summary>

Refs: #<issue-id>
```

Where:

* `<type>` expresses the nature of the change (e.g. `feat`, `fix`, `docs`, `chore`)
* `<scope>` identifies the affected area
* `Refs` links the commit to one or more issues

This convention is not cosmetic; it is essential for traceability.

---

## Merge requests and review

All non‑trivial changes must be introduced via **merge requests**.

Merge requests serve to:

* group related commits
* provide a focused review context
* document trade‑offs and alternatives

Reviews should address:

* alignment with requirements and specifications
* clarity of intent
* impact on existing artefacts
* traceability and classification compliance

Approval signifies not only correctness, but **shared understanding**.

---

## Project management without fragmentation

This project deliberately avoids external project management tools where possible.

When coordination, discussion, and delivery are separated across tools, context is lost and institutional memory degrades.

By keeping:

* planning (issues)
* discussion (comments, discussions)
* decisions (merge requests)
* delivery (code, tests, pipelines)

within a single workbench, the project maintains semantic integrity over time.

---

## Transparency and accountability

All substantive communication occurs in the open workbench environment, subject to access control where required.

Private communication channels (e‑mail, chat) may be used for logistics, but **must not replace traceable discussion** for decisions affecting the system.

---

## Final note

Civilised systems endure not because every decision was perfect, but because the reasons for those decisions were preserved.

This governance model exists to ensure that communication, coordination, and change leave a durable trace — one that future builders can understand, question, and improve.
