---
artefact_type: automation
visibility: public
audience: everyone
form: text
role: delivery
status: informative
owner: engineering
---

# Automation & Governance Engineering

This folder (`80-automation`) represents the **Active Governance Layer** of the project workbench.

Unlike static documentation (00-40) or passive code (60), this directory contains the **machinery** that actively enforces rules, verifies compliance, and generates evidence.

## Philosophy: "The Factory"

If `00-project-governance` is the **Law**, `80-automation` is the **Police**. It transforms "Bureaucracy" from a paper-based bottleneck into an automated enabler.

## Components

The automation layer is divided into three functional domains:

### 1. CI/CD Pipelines (`pipelines/`)

**"The Assembly Line"**
- **Mechanism**: GitHub Actions / Tekton / Jenkins.
- **Function**: Orchestrates the Trusted Supply Chain.
- **Role**: Ensures every commit is signed, every artifact is traceable, and every deployment is authorized via generic OIDC/WIF patterns.
- **Key Files**: `01-governance-gatekeeper.yaml`, `02-integration-orchestration.yaml`, `03-report-generation.yaml`.

### 2. Analytical Governance (`analytical/`)

**"The Risk Engine"**
- **Mechanism**: Custom Python Parsers & Graph Logic.
- **Function**: Performs "Bureaucracy-as-Code".
- **Role**: Parses human-readable specifications (`40-specifications`), builds dependency graphs, and calculates the "Blast Radius" of changes to alert experts only when necessary.
- **Key Files**: `spec_parser.py`, `impact_analyzer.py`.

### 3. AI Governance Oracle (`ai-governance/`)

**"The Advisor"**
- **Mechanism**: RAG (Retrieval-Augmented Generation).
- **Function**: Navigates the complexity of the Rulebook.
- **Role**: Provides interactive, context-aware compliance advice to developers, reducing the cognitive load of adhering to institutional rules.
- **Key Files**: `knowledge_indexer.py`, `policy_bot.py`.

## Relationship to the Workbench

- **Input**: Consumes contents from layer 00- to 60- (project governance, legal framework, rulebook, architecture, specifications, tests,and code).
- **Output**: Generates Evidence (`70-reports`) and Deployable Artifacts.

## Governance

- All automation code acts as **infrastructure-as-code**, **governance-as-code**, and **policy-as-code**.
- Changes to this folder are effectively **amendments to the constitution**, as they alter how the project is governed.

