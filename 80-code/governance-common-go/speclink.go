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

// SpecLink declares an explicit traceability link between a code element and a
// normative specification artefact.
//
// This function is a no-op at runtime. Its purpose is to act as a marker
// for static analysis tools, auditors, and governance linters.
//
// Arguments:
//
//	specID: The Global ID of the Specification Document (e.g., "SPEC-LIQ-FUNC").
//	refID:  The Specific Requirement or Step ID (e.g., "REQ-LIQ-FUNC-01").
//
// No version is passed. An identifier names one statement for as long as that
// statement exists, so the reference stays valid across releases. The version
// this component builds against is declared once, in its manifest, the way a
// lockfile pins a library.
func SpecLink(specID string, refID string) {
	// This function intentionally does nothing.
	// It exists solely to embed governance metadata into the AST (Abstract Syntax Tree).
}

// Note: In a real-world Go implementation, we might also provide struct tags
// or comment-based directives if runtime overhead (function calls) is a concern
// in tight loops. For this workbench, explicit function calls are preferred for clarity.
