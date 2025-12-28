# Logical System and Visibility Boundaries

## Purpose

This document explains how this project treats **logical coherence** and **physical distribution** as separate concerns.

Its purpose is to make explicit a core design principle of this repository:

> **All artefacts participate in a single logical system, even when they are physically distributed across multiple repositories, registries, or access boundaries.**

This principle is essential for large institutional projects operating under legal, contractual, and security constraints.

---

## The problem of fragmented workbenches

In many institutional environments, collaboration is spread across a constellation of tools:

- document repositories
- issue trackers
- diagramming platforms
- contract management systems
- email and informal communication channels

While each tool serves a local purpose, together they fragment authority and meaning. No single system can assert coherence across artefacts, discussions, and delivery. Traceability must be reconstructed manually, often long after decisions were made.

The result is not merely inefficiency, but **institutional amnesia**: the gradual loss of context, rationale, and intent.

---

## Logical unity vs. physical distribution

This project deliberately separates two concerns:

- **Logical organisation** — how artefacts relate to one another
- **Physical storage** — where artefacts are hosted and who may access them

Logical unity does not require physical co-location.

A requirement may be public, its implementation restricted, and its binary output confidential — yet all three can still be governed as part of a single system if their relationships are explicit and enforced.

This distinction allows the project to remain coherent without violating visibility or contractual boundaries.

---

## Repositories as trust and visibility boundaries

Git-based platforms such as GitHub and GitLab enforce access control at the **repository level**, not at the file or folder level.

Rather than attempting to work around this limitation, this project embraces it.

Each repository is treated as a **trust boundary**, reflecting:

- visibility (public, restricted, confidential)
- contractual context (e.g. NDA-bound work)
- organisational responsibility

As a result, artefacts are expected to be distributed across multiple repositories in real deployments.

The structure shown in this repository is **didactic**: it demonstrates logical organisation. In practice, that structure is promoted into multiple repositories aligned with visibility constraints.

---

## CI/CD as the integrating spine

Logical coherence across distributed artefacts is achieved through **automation**, not co-location.

A central CI/CD pipeline acts as the integrating spine of the system. It is responsible for:

- enforcing artefact classification
- validating traceability rules
- coordinating builds and tests
- orchestrating delivery across repositories and registries

The pipeline logic itself may be public, auditable, and versioned like any other artefact.

The artefacts it accesses — source repositories, binary registries, secrets — remain protected through access control and credential management.

This separation allows transparency of *process* without disclosure of *content*.

---

## Public pipelines, protected artefacts

In this model, it is entirely valid — and often desirable — for:

- pipeline definitions to be publicly visible
- governance rules to be openly inspectable
- automation logic to be shared

while:

- confidential specifications
- sensitive implementations
- proprietary binaries
- cryptographic material

remain restricted or confidential.

Visibility is enforced at the access layer, not obscured through convention.

---

## Artefact registries and binary delivery

Binary artefacts (such as SDKs, libraries, simulators, or packaged services) are typically delivered through dedicated artefact registries, for example a self-hosted Artifactory.

In this project:

- registries store **bytes**
- Git stores **meaning**

Binary artefacts are governed through sidecar metadata maintained in Git, declaring:

- artefact identity
- classification and audience
- provenance (source, build, pipeline)
- registry location

This preserves traceability without forcing binaries into version control systems ill-suited to them.

---

## Why this outperforms document-centric toolchains

Compared to fragmented setups built around document repositories, ticketing systems, and email, this approach offers:

- a single authoritative system of record
- mechanical enforcement of consistency
- durable traceability from intent to delivery
- reduced dependence on human memory and discipline
- improved auditability and security posture

Most importantly, it preserves **semantic integrity** over time.

The system remembers what the institution decided, and why.

---

## Implications for audit, security, and sovereignty

This model aligns naturally with institutional requirements:

- **Auditability:** decisions, artefacts, and delivery are linked and reproducible
- **Security:** visibility boundaries are explicit and enforced
- **Sovereignty:** the workbench and registries can be self-hosted within controlled infrastructure

Governance is embedded in the system, not layered on top of it.

---

## Final note

Civilised systems endure not because everything is visible, but because everything is **accountable**.

By separating logical unity from physical distribution, this project shows how complex, multi-stakeholder systems can remain coherent without sacrificing security, legality, or trust.

