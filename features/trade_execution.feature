Feature: As a "TheCurrency Cloud" User I would like execute trades in convert page

  Scenario: user confirms sell currency is mandatory
    Given I have logged in with user_id "prod-tester@rabbitfx.com"
    And I navigate to "convert" page
    When I submit a quote
    Then am shown "Please Select Currency to Sell" message in "payment" page

  Scenario: user confirms buy amount is mandatory
    Given I have logged in with user_id "prod-tester@rabbitfx.com"
    And I navigate to "convert" page
    And I have entered "GBP" currency as "sell_currency"
    And I have entered "USD" currency as "buy_currency"
    When I submit a quote
    Then am shown "Minimum Value is 1" message in "payment" page

  Scenario: user confirms buy currency is mandatory
    Given I have logged in with user_id "prod-tester@rabbitfx.com"
    And I navigate to "convert" page
    And I have entered "GBP" currency as "sell_currency"
    When I submit a quote
    Then am shown "Please Select Currency to buy" message in "payment" page

  Scenario Outline: : user books a trade
    Given I am in login page
    And I have logged in with user_id "prod-tester@rabbitfx.com"
    And I navigate to "convert" page
    And I have entered "GBP" currency as "sell_currency"
    And I have entered "USD" currency as "buy_currency"
    And I have entered "100.20" amount and "<side>"
    And I have quoted the trade
    When I confirm the quote
    Then the trade is booked successfully

  Examples:
    | side   |
    | sell   |
    | buy    |
