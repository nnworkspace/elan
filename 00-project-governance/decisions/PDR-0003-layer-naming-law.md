---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: project-governance
---

# PDR-0003: Adopt the layer-naming law and rename functional-spec to behaviour-spec

| Field         | Value              |
| :------------ | :----------------- |
| Status        | Accepted           |
| Date          | 2026-05-26         |
| Deciders      | Project governance |
| Supersedes    | none               |
| Superseded by | none               |

## Context and problem statement

The word **"functional"** appeared at two different layers at once: as the requirements/functional-design sense upstream (near Layer 15) and as the **"functional specification"** downstream (a document in Layer 40). A reader could not tell, from the word alone, whether a thing fed the rulebook or derived from it. The single most important property of a layered model, the direction of dependency, was obscured by the vocabulary.

"Functional" is not the only offender. **"Standard"** spans scheme standards (upstream, near the rulebook) and the specification-format standard (downstream). **"Specification"** spans scheme-level specs and the Layer-40 technical spec sets. **"Product"** spans product design (upstream) and any "product specification" (downstream). Each such overload, left unmanaged, re-creates the same confusion.

## Decision drivers

- The direction of dependency must be readable from names alone.
- A name shared across two layers is the most efficient way to destroy that readability.
- The rule must be simple enough to apply without deliberation.

## Considered options

1. Leave names as they are and rely on context. Status quo; the confusion recurs every time the word is used.
2. Disambiguate case by case in prose. Documents the confusion rather than removing it.
3. Adopt a naming law that forbids any name from spanning two layers, and rename the offending artefacts.

## Decision

Adopt the layer-naming law:

> **No name may span two layers.** Every layer name, and every facet name within a layer, is unique to its level.

First applications:

- Layer 15 is named **Requirements**, not "Functional Design".
- The Layer-40 behavioural document is renamed **behaviour spec**: `*-functional-spec.md` becomes `*-behaviour-spec.md`. The spec-set facet taxonomy is **Behaviour, Interface, Data Model, Message Catalogue, Code Contract**, each name unique to its level.
- "Product" is reserved for the upstream product layers and not used to label Layer 40.

The law is recorded in the project governance docs and applied to existing artefacts as part of this change.

## Consequences

**Positive**

- Names now carry direction: a "requirement" is upstream of the rulebook; a "behaviour spec" (or interface / data model / message / contract) is downstream of it.
- The same discipline pre-empts the "standard", "specification", and "product" overloads before they cause the next confusion.

**Negative / accepted trade-offs**

- A one-time rename of the `functional-spec` files and any references to them.

**Re-evaluation triggers**

- If a new name is found to span two layers, treat it as a defect and rename, recording the fix.
