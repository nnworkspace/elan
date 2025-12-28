---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: project-governance
---

# Issue Labels

This document defines the canonical set of issue labels used in this repository.

Labels are a **governance instrument**, not a convenience feature. Their purpose is to provide a shared, machine-readable vocabulary that supports coordination, traceability, and oversight across disciplines.

The label set is intentionally small. Precision is achieved through clear definitions, not proliferation.

---

## Principles

Labels in this repository follow these principles:

- **Few, stable, and well-defined**
- **Consistent across the entire project**
- **Orthogonal**, each answering a different question
- **Complementary** to artefact classification, not a replacement

Labels should help readers understand *what kind of work an issue represents*, *where it sits in the lifecycle*, and *how it should be treated*.

---

## Label groups

Labels are grouped by their primary function.

---

### 1. Type labels

**Purpose:** Describe the *nature* of the issue.

| Label | Meaning |
|------|--------|
| `requirement` | A policy, legal, or institutional mandate that must be implemented or respected |
| `clarification` | A request to interpret, disambiguate, or explain existing material |
| `architecture` | A design or architectural decision affecting system structure |
| `implementation` | Concrete delivery work, including code, configuration, or documentation |
| `risk` | A technical, legal, operational, or organisational risk or constraint |
| `governance` | A proposal or change affecting project rules, workflow, or conventions |

Each issue **must** have exactly one Type label.

---

### 2. Status labels

**Purpose:** Indicate the current state of discussion or progress.

| Label | Meaning |
|------|--------|
| `proposed` | The issue has been raised but not yet agreed |
| `agreed` | A shared understanding or decision has been reached |
| `blocked` | Progress is prevented by an external dependency |
| `in-progress` | Active work is underway |
| `completed` | The issue’s intent has been fulfilled |

Status labels may change over time as the issue evolves.

---

### 3. Impact labels

**Purpose:** Signal the expected scope or consequence of change.

| Label | Meaning |
|------|--------|
| `breaking` | Introduces a change that is incompatible with existing assumptions |
| `non-breaking` | Change is compatible with existing behaviour |
| `high-impact` | Affects multiple artefacts, stakeholders, or system components |
| `low-impact` | Localised effect with limited ripple effects |

Impact labels support prioritisation and review depth.

---

### 4. Visibility labels (optional)

**Purpose:** Reflect the intended visibility of the subject matter.

| Label | Meaning |
|------|--------|
| `public` | Suitable for public discussion and artefacts |
| `restricted` | Intended for a defined group of authorised participants |
| `confidential` | Sensitive subject matter subject to NDA or access control |

These labels **do not enforce access control**. They serve as explicit signals and must align with artefact classification rules.

---

## Usage rules

- Labels should be applied **at issue creation**, not retroactively.
- Labels should be updated deliberately, not casually.
- When in doubt, prefer **fewer labels** over more.
- Labels should never contradict the artefact classification declared in documents or metadata.

---

## Governance of labels

The label set itself is part of project governance.

Changes to labels or definitions must be:

- proposed via a governance issue
- reviewed
- documented

Stability of meaning is more important than responsiveness to short-term needs.

---

## Final note

Labels are a language.

Used well, they reduce friction, preserve meaning, and make large collaborations intelligible. Used carelessly, they become noise.

This project chooses the former.
