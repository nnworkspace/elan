# artefact_type: policy
# visibility: public
# audience: everyone
# form: source
# role: governance
# status: informative
# owner: project-governance

# ------------------------------------------------------------------------------
# DISCLAIMER:
# This file is an ILLUSTRATIVE EXAMPLE of a Governance Policy definition.
# It demonstrates the LOGICAL FLOW of governance enforcement.
# It is NOT a production-ready policy and may be incomplete.
# ------------------------------------------------------------------------------

package governance.manifests

# Rule: Deny if a Component Manifest lacks an Owner
deny[msg] {
    manifest := input.manifest
    not manifest.owner
    msg := sprintf("Manifest '%v' (ID: %v) is missing mandatory 'owner' field", [manifest.path, manifest.id])
}

# Rule: Deny if ID format is invalid
deny[msg] {
    manifest := input.manifest
    not regex.match("^COMP-[A-Z]+-[0-9]+$", manifest.id)
    msg := sprintf("Manifest '%v' has invalid ID format '%v'. Must match COMP-XXX-00", [manifest.path, manifest.id])
}
