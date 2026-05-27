/*
 * artefact_type: code
 * visibility: restricted
 * audience:
 *   - ECB
 *   - PSP
 * form: text
 * role: implementation
 * status: normative
 * owner: NCB
 *
 * DISCLAIMER:
 * The code in this folder is **illustrative and educational**.
 * It does not represent official implementations, production-ready components,
 * or endorsed technical approaches for the Digital Euro or any other real-world system.
 *
 * PURPOSE:
 * This component serves as a reference implementation to demonstrate how technical
 * specifications are refined into code while maintaining strict auditability,
 * traceability, and mechanical governance across distinct institutional boundaries.
 * This structure enables automated compliance verification and live impact analysis.
 */

package main

import (
	"fmt"
	"log"
	"net/http"

	gov "eu.digitaleuro/governance-common"
)

// The Access Gateway Entry Point.
// Traceability: COMP-EUR-05
func main() {
	fmt.Println("Starting Digital Euro Access Gateway...")

	// Initialize Routes
	http.HandleFunc("/fund", handleFunding)
	http.HandleFunc("/defund", handleDefunding)

	// Start Server
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func checkIdempotency(w http.ResponseWriter, r *http.Request) bool {
	if r.Header.Get("Idempotency-Key") == "" {
		http.Error(w, "Missing Idempotency-Key header", http.StatusBadRequest)
		return false
	}
	return true
}

// Handles Funding Requests (Reverse Waterfall).
// Implements the specific requirement for validating funding payloads coming from PSPs.
func handleFunding(w http.ResponseWriter, r *http.Request) {
	if !checkIdempotency(w, r) {
		return
	}

	// Granular Traceability Link
	gov.SpecLink("SPEC-API-GW", "REQ-API-FUND-01", "0.1")

	fmt.Fprintf(w, "Funding Endpoint Reached via %s", r.Method)
}

// Handles Defunding Requests (Waterfall).
// Implements the specific requirement for validating defunding payloads.
func handleDefunding(w http.ResponseWriter, r *http.Request) {
	if !checkIdempotency(w, r) {
		return
	}

	// Granular Traceability Link
	gov.SpecLink("SPEC-API-GW", "REQ-API-DEFUND-01", "0.1")

	fmt.Fprintf(w, "Defunding Endpoint Reached via %s", r.Method)
}
