---
artefact_type: governance
visibility: public
audience: everyone
form: text
role: governance
status: normative
owner: project-governance
---

# PDR-0005: Reference by identifier, pin the version once

| Field         | Value              |
| :------------ | :----------------- |
| Status        | Accepted           |
| Date          | 2026-10-09         |
| Deciders      | Project governance |
| Supersedes    | none               |
| Superseded by | none               |

## Context and problem statement

Every traceability link in `80-code` carried a version: `@SpecLink(specId, refId, version)` in all four languages, and the same version appeared again in each test set manifest and on individual references inside the contract schemas and test vectors.

Two consequences followed. A release of a specification set meant editing every annotation that pointed at it, which is work proportional to the number of references rather than to the size of the change. And because the same fact was written in many places, the copies drifted: annotations said `0.1` almost everywhere and `0.2` in one place, against sets actually versioned `0.1.0` and `1.0.0`. The Java annotation made it worse by defaulting `version` to `"current"`, so a link could claim traceability without naming anything.

## Decision drivers

- A fact should be recorded once, in the place where it can be checked.
- The cost of a release should be proportional to what changed, not to how many references exist.
- A traceability claim must not be able to be vague.
- Code already has a mechanism for pinning dependencies. Documents do not, which is why they state versions in their text.

## Considered options

1. Keep the version on every reference, and add a check that all copies agree.
2. Remove the version from references, and pin it once per consuming deliverable.
3. Remove versions entirely and treat identifiers as timeless.

## Decision

Option 2.

An identifier names one statement for as long as that statement exists. If what the statement requires changes, it receives a new identifier, and identifiers are never reused. A set may add identifiers in a MINOR version; removing one, or changing what it requires, is a MAJOR version.

Downstream artefacts reference a specification by set identifier and statement identifier, without a version. The version a deliverable builds against is declared once, in its own manifest, under `depends_on`. Each release states what changed, by identifier, in the `changes` block of the set manifest.

Option 1 was rejected because a check that keeps copies in step still leaves the copies. Option 3 was rejected because an auditor must be able to establish which version was consulted.

## Consequences

- The four governance libraries lose the `version` argument, and the Java default `"current"` disappears with it.
- Moving a component to a new version of a set is one edit in one file.
- What must be re-read after a release follows from the `changes` block intersected with the identifiers a repository cites, instead of being estimated.
- Upstream references between documents keep their versions. There is no build system between two documents, so provenance has to be written in the text. The asymmetry is deliberate: the version is recorded once, in the place that can check it.
- A reference to an artefact that does not exist yet carries `:TBD`, so a gap is declared rather than broken.

## Relationship to issues and merge requests

Raised and carried out under issue #15.
