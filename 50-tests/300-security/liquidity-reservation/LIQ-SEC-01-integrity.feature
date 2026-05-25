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
@spec=SPEC-LIQ-FUNC @spec=SPEC-LIQ-DATA @component=COMP-PSP-02
Feature: Liquidity Integrity & Security Controls

  Governing rule:  Financial integrity and data minimisation (REQ-LIQ-01 / SEC-LIQ-01)
  Behaviour:       The Liquidity Engine guarantees that a single bank
                   reservation cannot fund two wallets, that internal banking
                   identifiers never cross the privacy boundary, and that
                   funding is authorised only for a certificate holding the
                   liquidity role.

  Background:
    Given the Access Gateway (COMP-EUR-05) is active
    And API traffic to the Eurosystem is monitored

  @trace=INT-LIQ-02 @trace=REQ-LIQ-01 @security_control=INTEGRITY
  Scenario: A reused reservation cannot fund a second wallet
    # Attack: An attacker tries to use one bank lock to fund TWO digital wallets
    # Technique: Replay a valid reservation_proof with a NEW Idempotency Key
    Given 10.00 EUR has already been funded using reservation_proof "HASH_A"
    When a new "POST /fund" request reuses the same reservation_proof "HASH_A"
    And a fresh Idempotency-Key "UUID-NEW" is provided
    Then the Access Gateway returns "409 Conflict"
    And the error code indicates "RESERVATION_ALREADY_USED"
    And no new Digital Euro liability is created

  @trace=DAT-PRI-01 @trace=SEC-LIQ-01 @security_control=DATA_MINIMIZATION
  Scenario: An internal banking ID is blocked at the boundary
    # Attack: The PSP Adapter implementation is lazy and sends the raw CBS ID
    Given a Funding Payload is constructed
    But it includes the forbidden field "cbs_reference": "DE-INTERNAL-123"
    When the caller sends the "POST /fund" request
    Then the Access Gateway returns "400 Bad Request"
    And the error detail mentions "Forbidden field: cbs_reference"
    And the Security Audit Log records "PII_LEAK_ATTEMPT"

  @trace=ARCH-SEC-02 @security_control=AUTHORIZATION
  Scenario: A certificate without the liquidity role is refused
    # Attack: Use a valid QWAC, but one that is only authorized for Onboarding
    Given a caller authenticates using a valid QWAC with role "ONBOARDING_AGENT"
    When the caller attempts to call "POST /fund"
    Then the Access Gateway returns "403 Forbidden"
    And the error indicates "Insufficient Role: LIQUIDITY_MANAGER required"
