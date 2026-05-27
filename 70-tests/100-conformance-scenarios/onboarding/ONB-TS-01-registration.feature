# artefact_type: evidence
# visibility: public
# audience: everyone
# form: text
# role: evidence
# status: normative
# owner: system-quality
# DISCLAIMER: This content is illustrative and for educational purposes only.
# It demonstrates a methodology for structure and traceability.
# It does not represent the test scenarios or requirements of the official Digital Euro project or any other real project.
@spec=SPEC-OB-FUNC @spec=SPEC-OB-INT @component=COMP-EUR-05
Feature: User Identity Registration

  Governing rule:  One Person / One Identity (ONB-01)
  Behaviour:       A PSP onboards a customer by registering an anonymised
                   Identity Hash with the Access Gateway. Each natural person
                   resolves to exactly one digital euro identity, so a hash
                   that already exists is rejected rather than duplicated.
                   Registration is idempotent: a replayed request yields the
                   original result without creating a second record.

  Background:
    Given the Access Gateway (COMP-EUR-05) is available
    And the PSP "PSP-DE-001" holds a valid QWAC certificate

  @trace=TR-OB-03 @trace=TR-OB-04 @trace=OP-OB-01 @trace=STEP-REG-01
  Scenario: A new identity is registered
    Given the PSP has completed KYC for National ID "PASSPORT:DE:123456789"
    And the deterministic Identity Hash is computed according to Algo 6.1
    When the PSP sends a "POST /aliases" request with the Identity Hash
    Then the Access Gateway returns "201 Created"
    And the response payload contains a valid "alias_id"
    And the User State transitions from "CHECKING_ALIAS" to "ACTIVE"

  @trace=TR-OB-05 @trace=REQ-OB-FUNC-05 @trace=STEP-DUP-04 @trace=Rule_ONB-01
  Scenario: A duplicate identity is rejected
    Given the Identity Hash for "PASSPORT:FR:987654321" already exists in the Registry
    When the PSP sends a "POST /aliases" request with this existing Identity Hash
    Then the Access Gateway returns "409 Conflict"
    And the error code is "DUPLICATE_IDENTITY"
    And the User State transitions from "CHECKING_ALIAS" to "REJECTED"

  @trace=OP-OB-02 @trace=INT-OB-04
  Scenario: A replayed registration is idempotent
    Given the PSP has registered a user with Idempotency-Key "UUID-1234"
    When the PSP resends the same "POST /aliases" request with Idempotency-Key "UUID-1234"
    Then the Access Gateway returns "201 Created"
    And the response body matches the original successful response
    And no new record is created in the Registry
