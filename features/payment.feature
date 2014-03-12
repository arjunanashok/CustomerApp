Feature: As a "TheCurrency Cloud" User I would  like to send my password details
  in forgot password page

  Background:
    Given I am in login page
    And I have logged in with user_id "prod-tester@rabbitfx.com"
    And I navigate to "payment" page

  Scenario: user confirms currency is mandatory
    When I submit the details in "payment" page
    Then am shown "Select Currency" message in "payment" page


  Scenario: user confirms payment amount is mandatory
    Given I have selected "USD" as payment currency
    When I submit the details in "payment" page
    Then am shown "Minimum Value is 1" message in "payment" page


  Scenario: user confirms beneficiary name is mandatory
    Given I have selected "USD" as payment currency
    And I have entered "100.00" payment amount
    When I submit the details in "payment" page
    Then am shown "Select Beneficiary Name" message in "payment" page





