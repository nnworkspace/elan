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

package governance.headers

# Rule: Deny if CLASSIFICATION header is missing
deny[msg] {
    file := input.file
    not contains(file.content, "CLASSIFICATION:")
    msg := sprintf("File '%v' is missing mandatory CLASSIFICATION header", [file.path])
}

# Rule: Deny if DISCLAIMER header is missing
deny[msg] {
    file := input.file
    not contains(file.content, "DISCLAIMER:")
    msg := sprintf("File '%v' is missing mandatory DISCLAIMER header", [file.path])
}
