// artefact_type: code
// visibility: restricted
// audience:
//   - ECB
//   - PSP
// form: text
// role: implementation
// status: normative
// owner: NCB
//
// DISCLAIMER:
// The code in this folder is **illustrative and educational**.
// It does not represent official implementations, production-ready components,
// or endorsed technical approaches for the Digital Euro or any other real-world system.
//
// PURPOSE:
// This component serves as a reference implementation to demonstrate how technical
// specifications are refined into code while maintaining strict auditability,
// traceability, and mechanical governance across distinct institutional boundaries.
// This structure enables automated compliance verification and live impact analysis.

module eu.digitaleuro/access-gateway

go 1.21

require eu.digitaleuro/governance-common v0.1.0-SNAPSHOT

replace eu.digitaleuro/governance-common => ../governance-common-go
