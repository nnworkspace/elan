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
@spec=SPEC-LIQ-FUNC @spec=SPEC-LIQ-INT @component=COMP-PSP-02
Feature: Liquidity Reverse Waterfall (Automated Funding)

  Governing rule:  No Funding at Risk, scheme solvency guaranteed (LIQ-01)
  Behaviour:       A PSP Liquidity Engine funds a digital euro wallet from a
                   Commercial Bank Money reservation so a user can pay without
                   pre-funding. Funding is atomic: bank funds are locked, then
                   captured only once the Eurosystem settles. If settlement is
                   refused, the lock is voided and the funds released. Retries
                   are idempotent, so no double-funding can occur.

  Background:
    Given the Access Gateway (COMP-EUR-05) is operational
    And the Liquidity Engine holds a valid QWAC certificate
    And a secure session is established

  @trace=TR-LIQ-04 @trace=TR-LIQ-05 @trace=OP-LIQ-01 @trace=STEP-FUND-02
  Scenario: A reverse waterfall funds the wallet atomically
    # Happy Path: Lock -> Fund -> Capture
    Given a user initiates a payment requiring 10.00 EUR
    And the Liquidity Engine has locked 10.00 EUR in the Core Banking System
    And a "reservation_proof" (Hash) has been generated
    When the Liquidity Engine sends a "POST /fund" request with amount 1000 and the reservation proof
    Then the Access Gateway returns "200 OK"
    And the response payload contains a "settlement_ref"
    And the Internal Reservation transitions to "SETTLED"
    And the Liquidity Engine triggers "CaptureFunds" on the Core Banking System

  @trace=TR-LIQ-06 @trace=REQ-LIQ-02 @trace=Rule_LIQ-01
  Scenario: A settlement refusal rolls back atomically
    # Critical Negative Path: Lock -> Fund Fail -> Void
    Given the Liquidity Engine has locked 50.00 EUR in the Core Banking System
    When the Liquidity Engine sends a "POST /fund" request with amount 5000
    But the Access Gateway returns "403 Forbidden" (Limit Breach)
    Then the Internal Reservation transitions to "ROLLING_BACK"
    And the Liquidity Engine immediately triggers "VoidLock" on the Core Banking System
    And the final Internal Reservation status is "FAILED"
    And the Commercial Funds are released to the user

  @trace=INT-LIQ-02
  Scenario: A retried funding request is idempotent
    Given the Liquidity Engine has sent a funding request with Idempotency-Key "UUID-555"
    And the request timed out
    When the Liquidity Engine resends the same request with Idempotency-Key "UUID-555"
    Then the Access Gateway returns the original response
    And no double-funding occurs in the Settlement Engine
