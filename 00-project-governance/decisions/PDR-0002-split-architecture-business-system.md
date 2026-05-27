---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: project-governance
---

# PDR-0002: Split Architecture into Business Architecture (25) and System Architecture (30)

| Field         | Value              |
| :------------ | :----------------- |
| Status        | Accepted           |
| Date          | 2026-05-26         |
| Deciders      | Project governance |
| Supersedes    | none               |
| Superseded by | none               |

## Context and problem statement

The model carried a single Architecture layer (`30-architecture`). But "architecture" in a regulated, multi-stakeholder system is two different things at two different altitudes:

- **Business architecture**: how the actors interact, who sees which data, the privacy and data-governance design, the interaction shape of the system.
- **System architecture**: the components and their design.

Folding both into one layer hides a real and consequential boundary. Business architecture derives from the rulebook and expresses intent; system architecture realises it. And in real programmes the two frequently sit under **different owners**, the institution owning the business architecture, a vendor owning the system architecture, with the artefacts crossing that boundary. A single layer makes that boundary invisible.

## Decision drivers

- Distinct altitudes and distinct concerns should be distinct layers.
- The model should be able to express an owner boundary where one exists, without hard-coding any particular programme's arrangement.
- Specifications (Layer 40) derive from the system architecture; requirements and the rulebook sit above the business architecture. The chain must stay legible.

## Considered options

1. Keep a single `30-architecture` layer. Status quo; hides the business/technical and owner boundaries.
2. Keep one layer with sub-folders for business and technical. Cosmetic; the boundary is still not a layer boundary.
3. Split into two layers: **Business Architecture (25)** and **System Architecture (30)**.

## Decision

Split the architecture layer into:

- **`25-business-architecture/`**: interactions, data and privacy design, the business-level structure. Derives from the rulebook (20).
- **`30-system-architecture/`**: components and their design. Derives from the business architecture (25) and feeds the specifications (40).

The lower layer is named **System Architecture**, not *Technical Architecture*. The word *technical* is overloaded (it attaches to specifications, to design, to tooling) and naming a layer with it invites the cross-layer collision the naming law forbids (see [`PDR-0003`](./PDR-0003-layer-naming-law.md)). *System architecture* names what the layer holds, the system's components and how they fit, without competing for an overloaded word.

The chain becomes `20 -> 25 -> 30 -> 40`. Where a programme has an owner/vendor boundary, it typically falls **between 25 and 30** (the institution owns the business architecture; a vendor owns the system architecture). This is recorded as the *illustrating example*, not a baked-in assumption: the layer model is domain-agnostic, and the Digital Euro is used only to illustrate it.

The current `30-architecture` documents are redistributed: interaction, context, and privacy/data design to Business Architecture (25); component-level design to System Architecture (30).

## Consequences

**Positive**

- The business/technical distinction, and any owner boundary, become legible at the layer level.
- The assurance story sharpens: when the institution specifies (10-25) and a vendor builds (30+), traceability across the 25/30 boundary is how the institution verifies the build honours its intent.

**Negative / accepted trade-offs**

- A one-time redistribution of the existing architecture documents, with references updated.
- Two layers to maintain where there was one.

**Re-evaluation triggers**

- If the business/technical split proves artificial for a given domain, or if the two layers routinely duplicate each other, revisit the boundary.
