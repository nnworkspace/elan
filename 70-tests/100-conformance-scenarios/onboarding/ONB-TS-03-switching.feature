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
Feature: User Account Switching (Portability)

  Governing rule:  Account portability, one identity across PSPs (ONB-04 / AM-011-004)
  Behaviour:       A user moves their digital euro identity from one PSP to
                   another while keeping a single identity. The receiving PSP
                   registers the existing Identity Hash with explicit switch
                   consent, and the previous PSP is notified. Without that
                   consent the request collides with the existing registration
                   and is rejected.

  Background:
    Given the Access Gateway (COMP-EUR-05) is available
    And the receiving PSP "PSP-DE-002" holds a valid QWAC certificate

  @trace=TR-OB-06 @trace=OP-OB-03 @trace=Rule_ONB-04 @trace=REQ-OB-FUNC-09
  Scenario: An existing user is switched to a new PSP
    Given the Identity Hash for "PASSPORT:DE:123456789" is currently registered with "PSP-DE-001" (Old PSP)
    When the receiving PSP sends a "POST /aliases" request with:
      | identity_hash  | <Computed Hash> |
      | switch_consent | true            |
    Then the Access Gateway returns "200 OK"
    And the response payload matches the "AliasRecord" schema
    And the "active_psp_id" field in the Registry is updated to "PSP-DE-002"
    And the Old PSP "PSP-DE-001" receives a "USER_SWITCHED_OUT" notification

  @trace=TR-OB-05 @trace=REQ-OB-FUNC-05 @trace=STEP-DUP-04
  Scenario: A switch without consent is rejected
    Given the Identity Hash for "PASSPORT:DE:123456789" is currently registered with "PSP-DE-001"
    When the receiving PSP sends a "POST /aliases" request with:
      | identity_hash | <Computed Hash> |
      # switch_consent is explicitly missing or false
    Then the Access Gateway returns "409 Conflict"
    And the error code is "DUPLICATE_IDENTITY"
    And the User Identity remains linked to "PSP-DE-001"
