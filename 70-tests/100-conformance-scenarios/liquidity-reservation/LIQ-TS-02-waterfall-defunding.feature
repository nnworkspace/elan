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
Feature: Liquidity Waterfall (Automated Defunding)

  Governing rule:  Holding limits enforced by the Waterfall (LIQ-02 / LIQ-03)
  Behaviour:       When digital euro holdings exceed a user's limit, the PSP
                   Liquidity Engine automatically defunds the excess to the
                   user's commercial bank account. A merchant with a zero
                   holding limit is defunded immediately on receipt. Defunding
                   is strictly ordered: the bank account is credited only after
                   the digital euro is burned, never before.

  Background:
    Given the Access Gateway (COMP-EUR-05) is operational
    And the Liquidity Engine holds a valid QWAC certificate

  @trace=REQ-LIQ-03 @trace=OP-LIQ-02 @trace=STEP-WAT-01
  Scenario: Excess over the holding limit is defunded
    Given a user has a Holding Limit of 3000.00 EUR
    And an incoming payment brings the balance to 3500.00 EUR
    And the Liquidity Engine calculates an excess of 500.00 EUR
    When the Liquidity Engine sends a "POST /defund" request with amount 50000 and reason "LIMIT_BREACH"
    Then the Access Gateway returns "200 OK"
    And the Digital Euro balance is reduced to 3000.00 EUR
    And the Liquidity Engine credits 500.00 EUR to the user's Commercial Bank Account

  @trace=Rule_LIQ-03 @trace=DAT-MSG-04
  Scenario: A zero-holding merchant is defunded on receipt
    Given a Merchant has a Holding Limit of 0.00 EUR
    When the Merchant receives a payment of 50.00 EUR
    Then the Liquidity Engine immediately sends a "POST /defund" request with amount 5000 and reason "ZERO_HOLDING_CONFIG"
    And the Access Gateway returns "200 OK"
    And the Merchant's Digital Euro balance remains 0.00 EUR
    And the Merchant's Commercial Bank Account is credited with 50.00 EUR

  @trace=REQ-LIQ-FUNC-05
  Scenario: A failed defund does not credit the bank
    # If the tokens cannot be burned, the bank account must NOT be credited
    Given an excess of 100.00 EUR is detected
    When the Liquidity Engine sends a "POST /defund" request
    But the Access Gateway returns "500 Internal Server Error"
    Then the Commercial Bank Account must NOT be credited
    And the Liquidity Engine must retry the defunding operation later
