---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: project-governance
---

# PDR-0004: Renumber the layers to regular decades

| Field         | Value              |
| :------------ | :----------------- |
| Status        | Accepted           |
| Date          | 2026-05-27         |
| Deciders      | Project governance |
| Supersedes    | none               |
| Superseded by | none               |

## Context and problem statement

Two layers had been inserted at half-steps: Requirements at `15` (PDR-0001) and Business Architecture at `25` (PDR-0002). The half-step numbers signalled "inserted later" and left uneven, unintuitive gaps. A reader scanning the tree saw `10, 15, 20, 25, 30, 40, ...`, which reads as an afterthought rather than a deliberate sequence, and leaves little obvious room to insert further layers without more half-steps.

## Decision drivers

- The numbering should read as a deliberate, regular sequence, not a patched one.
- Every layer should sit on a round decade, with even gaps left for future insertion.
- `00` and `10` are well established and should not move.
- Automation enforces every other layer; it is a meta-layer and should read as such.

## Considered options

1. Keep the half-steps (`15`, `25`). Status quo; uneven and reads as patched.
2. Renumber to regular decades, promoting the half-step layers to full numbers.
3. Zero-pad every prefix to three digits (`000`, `010`, ...). Perfect lexical and numeric order, but it disturbs the established `00` and `10`.

## Decision

Renumber the layers to regular decades. `00`, `10`, and `99` are unchanged.

| Old | New | Layer |
| :--- | :--- | :--- |
| 00 | 00 | project-governance |
| 10 | 10 | legal-framework |
| 15 | 20 | requirements |
| 20 | 30 | rulebook |
| 25 | 40 | business-architecture |
| 30 | 50 | system-architecture |
| 40 | 60 | specifications |
| 50 | 70 | tests |
| 60 | 80 | code |
| 70 | 90 | reports |
| 99 | 99 | launch-materials |
| 80 | 100 | automation |

Automation moves to **`100`**: it is the active-governance engine that enforces every layer above it, so it reads as the meta-layer beyond the chain rather than a step within it.

**Accepted caveat:** `100-automation` sorts lexically between `10-` and `20-` in plain file listings and GitHub's web view, because those sort prefixes as strings, not numbers. The curated structure tree in the root `README.md` shows the intended order, and natural-sort tooling (most IDEs) orders it last. This was a deliberate choice over staying two-digit.

The Set identifiers (`SET-RULEBOOK`, `SET-ARCH`, `SPEC-*`, `REQ-*`) carry no layer numbers and are unchanged, so all `@rule` / `@arch` / `@spec` traceability anchors hold.

The earlier decision records (PDR-0001, PDR-0002, PDR-0003) are brought to the new numbers in place, so the repository reads coherently end-to-end; this table and the git history preserve the original numbering.

## Consequences

**Positive**

- The tree reads as a deliberate decade sequence with even room to grow between layers.
- The two previously-inserted layers are now first-class, indistinguishable from the originals.

**Negative / accepted trade-offs**

- A one-time, repository-wide rename of folders and references.
- `100-automation` does not sort last in plain lexical listings (see the caveat above).

**Re-evaluation triggers**

- If a future layer needs to sit before `00` or between `00` and `10`, or if the three-digit automation prefix causes tooling friction that outweighs its meaning, revisit the scheme.
