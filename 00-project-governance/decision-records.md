---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: project-governance
---

# Decision Records

## Purpose

This document defines how **significant decisions** are recorded, reviewed, and preserved across the project.

A long-lived institutional system accumulates decisions that are costly to reverse: the choice of a toolchain, a structural convention, a deferred migration, the rejection of an alternative. The reasoning behind such decisions is often the first thing lost. Meetings end, chat scrolls away, and authors move on. What remains is a system whose shape no one can fully explain.

A **decision record** is the durable answer to the question a future builder, reviewer, or auditor will eventually ask: *why was it done this way, and what else was considered?*

> A decision record captures the reasoning **as it stood at the time the decision was made** — not as it is rationalised later.

### A note on decision records for general readers

This practice is known in the software industry as the **Architecture Decision Record**, or **ADR**. The name is historical: the technique began with software architecture, but the discipline applies to any decision of consequence, whether legal, structural, procedural, or technical. This project therefore uses the broader term **decision record** and applies it across all layers.

A decision record is not a design document and not a meeting minute. It is a short, self-contained statement that one decision was made, why, and at what cost. Its value is precisely that it does not change once settled.

---

## What belongs in a decision record

Write a decision record for a decision that is:

- **costly to reverse**, or
- **cross-cutting**, affecting more than one artefact, layer, or team, or
- one whose **rationale will not be obvious** to a future reader.

Do **not** write one for routine or easily reversible choices. Over-production is the main way this practice decays: a folder of a hundred trivial records is as useless as no records at all. A healthy project produces a small number of decision records over its lifetime, each one load-bearing.

A decision record may also record a decision **not** to act, or to defer. A deliberate "not yet, and here is when to revisit" is itself a decision worth preserving.

---

## Scope: project-wide and repository-local

The project is logically unified but physically distributed across repositories (see [`logical-system-and-visibility.md`](logical-system-and-visibility.md)). Decision records follow the same model, at two scopes:

| Scope            | Prefix | Location                              | For                                                       |
| :--------------- | :----- | :------------------------------------ | :-------------------------------------------------------- |
| Project-wide     | `PDR-` | `00-project-governance/decisions/`          | Decisions that cut across repositories: conventions, shared toolchain, governance changes. |
| Repository-local | `DR-`  | `<repository>/_governance-local/decisions/` | Decisions confined to a single repository.                |

Project-wide records sit in `00-project-governance/`, the project's governance container. Repository-local records sit in `_governance-local/`, each repository's own governance container; the underscore keeps that folder grouped with other meta-folders, distinct from the repository's content artefacts.

Each scope maintains its own number sequence, zero-padded to four digits, beginning at `0000`. `PDR-0000` and the first `DR-0000` of each repository record the decision to adopt this practice itself, and anchor it to this document.

---

## Lifecycle and status

A decision record moves through an explicit lifecycle:

```text
Proposed  ──►  Accepted  ──►  Superseded   (a later record replaces it)
                          └─►  Deprecated  (no longer applies, no replacement)
```

- **Proposed** — a draft. Fully editable. Reviewed and revised freely.
- **Accepted** — the decision is settled. The body of the record is now **immutable**.
- **Superseded / Deprecated** — applied to a previously accepted record when a later record replaces it, or when it ceases to apply.

Status is declared in the record's metadata block and is the only field that changes after acceptance.

---

## Immutability

Once a decision record is **Accepted**, its context, options, decision, and consequences are **frozen**. They are not edited to reflect a later change of mind.

This rule is deliberate, and it lowers cost rather than raising it:

1. **It preserves the record as evidence.** An accepted record shows what was known, and what constraints applied, *at decision time*. Editing it destroys the one thing the record exists to provide.
2. **It makes the supersession chain first-class.** To change a decision, a **new** record is written that supersedes the old one. The chain of supersession is readable as a sequence of whole, coherent documents, not reconstructed from a history of edits.
3. **It does not depend on version-control history surviving intact.** Commit history can be rewritten, squashed, or lost in a repository migration. The record file surviving is enough.

Version-control history remains the forensic substrate: who changed what, and when. The immutable decision record is the **readable** layer above it. The two are complementary, not redundant.

To change an accepted decision, write a new record. Update only the `Status` and `Superseded by` fields of the old one. Retrofitting an old document to still make sense is more work, not less, than writing fresh in today's context.

---

## The record template

A decision record is a single Markdown file named `PDR-NNNN-short-kebab-title.md` or `DR-NNNN-short-kebab-title.md`, using the following structure. Copyable starting points live alongside the records: [`decisions/PDR-TEMPLATE.md`](decisions/PDR-TEMPLATE.md) for project-wide records, and [`decisions/DR-TEMPLATE.md`](decisions/DR-TEMPLATE.md) to copy into a layer's `_governance-local/decisions/` folder.

```markdown
---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: <owner>
---

# DR-NNNN: <short decision title>

| Field         | Value                       |
| :------------ | :-------------------------- |
| Status        | Proposed                    |
| Date          | YYYY-MM-DD                  |
| Deciders      | <names or roles>            |
| Supersedes    | <DR-NNNN, or none>          |
| Superseded by | <DR-NNNN, or none>          |

## Context and problem statement

The situation that forces a decision, and the constraints that apply, as
understood today. Frozen at acceptance.

## Decision drivers

- <driver, requirement, or constraint>

## Considered options

1. <Option A> — <one line>
2. <Option B> — <one line>

## Decision

The option chosen, stated plainly, and why.

## Consequences

Positive outcomes, accepted trade-offs, and concrete conditions under which
the decision should be re-evaluated.
```

The metadata block is classified like any other governance artefact, per the [Artefact Classification Model](artefact-classification.md).

---

## Relationship to issues and merge requests

Decision records do not replace issues, discussions, or merge requests; they distil them. The exploration happens in an issue or discussion; the decision is made and reviewed through a merge request; the **decision record is the durable summary** that outlives both (see [`communication-and-project-management.md`](communication-and-project-management.md)).

The merge request that introduces or accepts a decision record is itself part of the audit trail: it carries the review, the approval, and the discussion that led to acceptance. The commit that adds the record must reference its issue, like any other commit.

---

## Enforcement

Decision records are subject to automated governance checks, in the spirit of the project's [Linting Rules](linting-rules.md):

- every record declares classification metadata and a valid `Status` value;
- number sequences are contiguous within each scope, with no reuse;
- the body of an **Accepted** record is not modified within a merge request — only its `Status` and `Superseded by` fields may change;
- a record marked `Superseded` names the record that supersedes it, and that record exists.

These checks make the immutability rule mechanical rather than a matter of goodwill.

---

## Final note

A system is not durable because every decision in it was correct. It is durable because the reasons for those decisions were preserved, and can therefore be questioned, defended, or overturned by those who come later.

A decision record is a small discipline. Institutional amnesia is the large cost it prevents.
