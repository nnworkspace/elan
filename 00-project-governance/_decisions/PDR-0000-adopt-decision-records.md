---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: project-governance
---

# PDR-0000: Adopt decision records across the project

| Field         | Value                       |
| :------------ | :-------------------------- |
| Status        | Accepted                    |
| Date          | 2025-12-29                  |
| Deciders      | Project governance          |
| Supersedes    | none                        |
| Superseded by | none                        |

## Context and problem statement

A long-lived, multi-stakeholder project accumulates decisions that are costly to reverse: toolchain choices, structural conventions, deferred migrations, the rejection of alternatives. Today the reasoning behind such decisions survives only in meetings, chat, and the memory of whoever was present. When those fade, the project is left with a system whose shape no one can fully account for, and auditors, reviewers, and new builders have no durable answer to "why was it done this way, and what else was considered?"

Version-control history records *what* changed and *when*, but it is a forensic substrate, not a readable one. No reviewer reconstructs a decision by reading years of diffs.

## Decision drivers

- Decisions of consequence must remain auditable long after they are made.
- The reasoning must be readable as it stood at decision time, not as later rationalised.
- The record must survive repository migrations and version-control history rewrites.
- The practice must be low-overhead, or it will not be sustained.

## Considered options

1. No formal record — rely on meetings, chat, and version-control history. The status quo.
2. A central decision wiki — one mutable page per decision.
3. Decision records — numbered, immutable Markdown files, versioned alongside the work, scoped project-wide and repository-local.

## Decision

The project adopts **decision records** as defined in [`decision-records.md`](../decision-records.md). Decisions that cut across repositories are recorded as `PDR-` files in `00-project-governance/_decisions/`; decisions confined to a single repository are recorded as `DR-` files in that repository's own `_decisions/` folder. Records are immutable once accepted; a decision is changed by writing a new record that supersedes the old one.

Option 1 leaves no readable record. Option 2 makes the record mutable, which destroys its value as evidence of what was known at decision time, and offers nothing that a Markdown file under version control does not. Option 3 keeps the record next to the work, under the same governance and automation as every other artefact, and immutable once settled.

This record, `PDR-0000`, is itself the first application of the practice it adopts.

## Consequences

**Positive**

- A future builder or auditor can read a folder of self-contained decisions rather than reconstruct intent from diffs.
- The supersession chain shows the evolution of reasoning as whole documents.
- The record is plain Markdown under version control: portable, classifiable, and durable across repository moves.

**Negative / accepted trade-offs**

- A small, recurring discipline cost for every significant decision.
- Requires judgement about granularity; over-production would dilute the practice.

**Re-evaluation triggers**

- If significant decisions are routinely made without records, or records are routinely written for trivial choices, revisit the practice and its granularity guidance in [`decision-records.md`](../decision-records.md).
