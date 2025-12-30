---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: project-governance
---

# Commit Message Conventions

## Purpose

This document defines the **commit message standards** for this repository.

In a regulated environment, every change to the system must be:
1.  **Understandable** (what changed?)
2.  **Classifiable** (what kind of change is it?)
3.  **Traceable** (why was it changed?)

Commits are not just save points. They are the granular history of the project's evolution. This standard ensures that this history is machine-readable and auditable.

## The Standard

We adhere to the **Conventional Commits** specification (v1.0.0), enforced via `commitlint`.

### A Note on "Commitlint" for General Readers

To the non-technical reader, these strict formatting rules may appear pedantic. They are, in fact, an act of institutional memory. 

"Commitlint" acts as our digital archivist. It ensures that every contribution—whether a line of policy text or a block of software code—is filed with a clear label indicating its nature and its origin. This practice transforms a potentially chaotic stream of changes into a legible narrative, allowing future auditors to ask "why was this changed?" and receive an immediate answer without relying on the memory of the author.

For those wishing to explore the global standard we have adopted, see: [Conventional Commits](https://www.conventionalcommits.org/).

### Message Structure

Every commit message must consist of a **Header**, an optional **Body**, and a **Footer**.

```text
<type>(<scope>): <short description>

[optional body]

Refs: #<issue-id>
```

---

## 1. Header (Mandatory)

The header tells us **what** changed at a high level.

### Type

Must be one of the following:

| Type | Meaning |
| :--- | :--- |
| `feat` | A new feature |
| `fix` | A bug fix |
| `docs` | Documentation only changes |
| `style` | Changes that do not affect the meaning of the code (white-space, formatting, etc) |
| `refactor` | A code change that neither fixes a bug nor adds a feature |
| `perf` | A code change that improves performance |
| `test` | Adding missing tests or correcting existing tests |
| `build` | Changes that affect the build system or external dependencies |
| `ci` | Changes to our CI configuration files and scripts |
| `chore` | Other changes that don't modify src or test files |
| `revert` | Reverts a previous commit |

### Scope

The scope is optional but strongly recommended. It should provide additional contextual information.
*   Examples: `(auth)`, `(api)`, `(governance)`, `(ci)`

### Description

*   Use the imperative, present tense: "change" not "changed" nor "changes".
*   Don't capitalize the first letter.
*   No dot (.) at the end.

---

## 2. Body (Optional)

The body should include the motivation for the change and contrast this with previous behavior.

*   Use the imperative, present tense.
*   Wrap lines at 72 characters.

---

## 3. Footer (Mandatory for Traceability)

The footer serves the critical purpose of **Traceability**.

> **Rule:** Every commit must reference at least one existing Issue.

This ensures that no code enters the repository without a documented intent or requirement.

### Syntax

Use the `Refs` token (or `Closes` for closing issues).

*   `Refs: #123`
*   `Closes: #123`
*   `Refs: #123, #124`

---

## Examples

### Good Commit (Feature)
```text
feat(auth): add jwt token validation

Implement standard JWT validation for API endpoints.
Token expiration is set to 1 hour by default.

Refs: #42
```

### Good Commit (Docs)
```text
docs(governance): add commit convention document

Formalise the commit message rules to support commitlint enforcement.

Refs: #101
```

### Bad Commit (No traceability)
```text
fix: fixed the login bug
```
*   ❌ Missing scope (acceptable but discourage)
*   ❌ Uppercase description
*   ❌ Missing `Refs` footer (Code Orphan)

---

## Enforcement

These rules are enforced automatically by `commitlint` in the CI/CD pipeline.
Commits that violate this convention will cause the pipeline to fail.

### How to enable checks locally

Contributors are encouraged to enable these checks on their local development machines to get immediate feedback.

Run the following command in the project root:

```bash
npm install
```

(Or `pnpm install` / `yarn install` / `bun install`).

This installs a git `commit-msg` hook. Once installed, `commitlint` will check your commit message every time you run `git commit`. If your message does not follow the convention, the commit will be rejected with a helpful error message explaining what needs to be fixed.


