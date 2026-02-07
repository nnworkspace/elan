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
  As a New PSP Adapter (Zone A)
  I want to switch a user's identity from another PSP to my own
  So that the user can change service providers while maintaining their single digital euro identity (Rule AM-011-004)

  Background:
    Given the Access Gateway (COMP-EUR-05) is available
    And I have a valid QWAC certificate for "PSP-DE-002" (New PSP)

  @trace=TR-OB-06 @trace=OP-OB-03 @trace=Rule_ONB-04 @trace=REQ-OB-FUNC-09
  Scenario: Successful switching of an existing user
    Given the Identity Hash for "PASSPORT:DE:123456789" is currently registered with "PSP-DE-001" (Old PSP)
    When I send a "POST /aliases" request with:
      | identity_hash  | <Computed Hash> |
      | switch_consent | true            |
    Then the Access Gateway returns "200 OK"
    And the response payload matches the "AliasRecord" schema
    And the "active_psp_id" field in the Registry is updated to "PSP-DE-002"
    And the Old PSP "PSP-DE-001" receives a "USER_SWITCHED_OUT" notification

  @trace=TR-OB-05 @trace=REQ-OB-FUNC-05 @trace=STEP-DUP-04
  Scenario: Attempting to register an existing user without switch consent
    Given the Identity Hash for "PASSPORT:DE:123456789" is currently registered with "PSP-DE-001"
    When I send a "POST /aliases" request with:
      | identity_hash | <Computed Hash> |
      # switch_consent is explicitly missing or false
    Then the Access Gateway returns "409 Conflict"
    And the error code is "DUPLICATE_IDENTITY"
    And the User Identity remains linked to "PSP-DE-001"
