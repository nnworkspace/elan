---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: project-governance
---

# PDR-0001: Insert Layer 15 (Requirements) between Legal & Policy and Rulebook

| Field         | Value              |
| :------------ | :----------------- |
| Status        | Accepted           |
| Date          | 2026-05-26         |
| Deciders      | Project governance |
| Supersedes    | none               |
| Superseded by | none               |

## Context and problem statement

The layer model ran from Legal & Policy (10) straight to the Rulebook (20). But the rulebook does not spring from legislation directly: between the legal mandate and the binding scheme rules sits a body of work that translates intent into concrete behaviour, user journeys, user requirements, and end-to-end process flows.

In the current structure this material has no home of its own. It lives implicitly inside the rulebook, which conflates two distinct things: *what the system must do* (requirements) and *the binding rules that govern it* (the rulebook). The conflation hides the direction of dependency, the very thing a layered model exists to make legible, and it lets the rulebook absorb material that is not, properly, rule content.

## Decision drivers

- Each layer should hold one kind of artefact, so the chain of dependency reads cleanly.
- Requirements and journeys are upstream inputs to the rulebook; they should be visible as such, not buried in it.
- The model must distinguish *requirements* (Layer 15) from the downstream *specifications* (Layer 40) without reusing a single ambiguous word (see PDR-0003).

## Considered options

1. Keep requirements implicit inside the rulebook. The status quo. Simple, but it conflates requirements with rules and hides the upstream feed.
2. Carry requirements as an annex to the rulebook. Keeps them adjacent but still subordinate to, and bundled with, the rulebook.
3. Introduce a dedicated **Layer 15 (Requirements)**, upstream of the rulebook, holding journeys, requirements, and end-to-end flows.

## Decision

Introduce **Layer 15 (Requirements)** as a first-class layer between Legal & Policy (10) and Rulebook (20), in a `15-requirements/` directory. It holds user journeys, user requirements, and end-to-end process flows. Its direction is `10 -> 15 -> 20`: requirements derive from legal and policy intent and *feed* the rulebook, which codifies them into binding scheme rules.

The layer is named **Requirements**, not "Functional Design", deliberately, to keep "functional" from spanning two layers (see PDR-0003). Requirements / journey content currently held in the rulebook is moved here.

This also serves the **de-bloat principle**: each layer's artefacts live in their own layer, so upper layers stay lean and material does not accrete into the rulebook.

## Consequences

**Positive**

- The dependency chain is legible: anything in Layer 15 is upstream of the rulebook; the rulebook becomes binding rules rather than a mixture of rules and requirements.
- Requirements and journeys gain a visible, versioned, classifiable home.

**Negative / accepted trade-offs**

- A one-time move of requirements content out of the rulebook, with the references updated.

**Re-evaluation triggers**

- If requirements material starts re-accreting into the rulebook, or if Layer 15 and Layer 40 (specifications) begin to blur, revisit the boundaries and PDR-0003.
