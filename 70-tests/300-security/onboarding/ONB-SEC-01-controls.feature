# artefact_type: evidence
# visibility: public
# audience: everyone
# form: text
# role: evidence
# status: normative
# owner: system-security
# DISCLAIMER: This content is illustrative and for educational purposes only.
# It demonstrates a methodology for structure and traceability.
# It does not represent the test scenarios or requirements of the official Digital Euro project or any other real project.
@spec=SPEC-OB-DATA @spec=SPEC-OB-INT @component=COMP-EUR-05
Feature: Onboarding Security Controls & Privacy Firewall

  Governing rule:  Privacy firewall, PII confined to Zone A (Zone_B_Firewall)
  Behaviour:       The Access Gateway sanitises and authenticates every
                   onboarding request so PII never crosses into Zone B and
                   unauthenticated requests are dropped immediately. A payload
                   carrying a forbidden Zone A field is rejected and logged; a
                   malformed hash is rejected before lookup; a request missing
                   the KYC JWS signature is refused.

  Background:
    Given the Access Gateway (COMP-EUR-05) is active
    And the Security Firewall rules are loaded

  @trace=INT-OB-01 @trace=DM-OB-03 @trace=Zone_B_Firewall @security_control=DATA_SANITIZATION
  Scenario: A payload carrying a Zone A field is blocked
    # This tests that the Gateway acts as a firewall for Zone B
    Given a caller holds a valid Identity Hash
    But the payload is constructed to include the Zone A field "full_name"
    When the caller sends the "POST /aliases" request
    Then the Access Gateway returns "400 Bad Request"
    And the error details indicate "Forbidden field: full_name"
    And the audit log shows a "PII_LEAK_ATTEMPT" warning
    And no data is forwarded to the DESP Platform

  @trace=DAT-MSG-01 @trace=REQ-OB-FUNC-02 @security_control=INPUT_VALIDATION
  Scenario: A malformed identity hash is rejected
    # This tests protection against injection or fuzzing attacks
    Given a payload carries identity_hash "Invalid_Non_Hex_String_!@#"
    When the caller sends the "POST /aliases" request
    Then the Access Gateway returns "400 Bad Request"
    And the error details mention "Pattern mismatch"

  @trace=INT-OB-02 @trace=SEC-OB-01 @security_control=AUTHENTICATION
  Scenario: A request without the KYC signature is refused
    # This tests that the JWS signature is mandatory, not optional
    Given a valid payload
    But the "JWS-Signature" header is stripped from the request
    When the caller sends the "POST /aliases" request
    Then the Access Gateway returns "401 Unauthorized"
    And the response indicates "Missing JWS Signature"
