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
@spec=SPEC-OB-INT @spec=SPEC-OB-DATA @component=COMP-EUR-05
Feature: User Status Query (State Recovery)

  Governing rule:  Identity lifecycle state is authoritative and queryable
  Behaviour:       A PSP queries the current lifecycle state of an Identity
                   Hash at the Access Gateway, either to recover after a
                   network failure or to check whether a user exists before
                   starting KYC. A known active identity returns its record;
                   an unknown hash returns 404; a malformed hash is rejected
                   as 400 before any lookup.

  Background:
    Given the Access Gateway (COMP-EUR-05) is operational
    And the PSP is authenticated with a valid QWAC

  @trace=OP-OB-02 @trace=DAT-ALS-03
  Scenario: An active user's state is returned
    # Pre-requisite: The user was previously registered via OP-OB-01
    Given an Identity Hash "A1B2...C3D4" exists in the Alias Registry
    And the recorded status is "ACTIVE"
    When the PSP sends a "GET /aliases/A1B2...C3D4" request
    Then the Access Gateway returns "200 OK"
    And the response payload matches the "AliasRecord" schema
    And the "status" field is "ACTIVE"
    And the "created_at" field is a valid ISO timestamp

  @trace=OP-OB-02 @trace=STEP-REG-06
  Scenario: An unknown identity returns not-found
    # Used by PSPs to check if a user is "New" before starting KYC
    Given the Identity Hash "F9E8...D7C6" does NOT exist in the Registry
    When the PSP sends a "GET /aliases/F9E8...D7C6" request
    Then the Access Gateway returns "404 Not Found"
    And the error code indicates "RESOURCE_NOT_FOUND"

  @trace=INT-OB-01 @trace=DAT-MSG-01
  Scenario: A malformed hash is rejected
    # Validates that the path parameter regex is enforced
    When the PSP sends a "GET /aliases/SHORT-HASH" request
    Then the Access Gateway returns "400 Bad Request"
    And the error details mention "Pattern mismatch"
