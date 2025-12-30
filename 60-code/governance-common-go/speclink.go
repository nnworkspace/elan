/*
 * artefact_type: implementation
 * visibility: public
 * audience: everyone
 * form: source
 * role: governance
 * status: normative
 * owner: eurosystem
 */

package tracing

// SpecLink declares an explicit, version-aware traceability link between a
// code element and a normative specification artefact.
//
// This function is a no-op at runtime. Its purpose is to act as a marker
// for static analysis tools, auditors, and governance linters.
//
// Arguments:
//
//	specID:  The Global ID of the Specification Document (e.g., "SPEC-LEDGER-001").
//	refID:   The Specific Requirement or Step ID (e.g., "REQ-SETTLEMENT-05").
//	version: The version of the spec being implemented (e.g., "1.2.0" or "current").
func SpecLink(specID string, refID string, version string) {
	// This function intentionally does nothing.
	// It exists solely to embed governance metadata into the AST (Abstract Syntax Tree).
}

// Note: In a real-world Go implementation, we might also provide struct tags
// or comment-based directives if runtime overhead (function calls) is a concern
// in tight loops. For this workbench, explicit function calls are preferred for clarity.
