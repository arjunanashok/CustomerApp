Feature: As a "TheCurrency Cloud" User I would like to login
  into Customer App so that I can use existing functionality like
  book trade, add beneficiary and view balance in my account.


  Scenario: user confirms login id is mandatory
    Given I am in login page
    When I submit login details
    Then am shown "Please Enter Login ID" message

  Scenario: user confirms password is mandatory
    Given I am in login page
    And I have entered userid "prod-tester@rabbitfx.com"
    When I submit login details
    Then am shown "Please Enter Password" message


  Scenario: user confirms security answer is mandatory
    Given I am in login page
    And I have entered userid "prod-tester@rabbitfx.com"
    And I have entered password "test"
    When I submit login details
    Then am shown "Please Enter Security Answer" message

  Scenario: user confirms authentication message
    Given I am in login page
    And I have entered userid "prod-tester@rabbitfx.com"
    And I have entered password "testing"
    And I have entered security answer "testing"
    When I submit login details
    Then am shown "Authentication failed with the supplied credentials" message

  Scenario: user successfully logins in customer app
    Given I am in login page
    And I have entered userid "prod-tester@rabbitfx.com"
    And I have entered password "test"
    And I have entered security answer "test"
    When I submit login details
    Then am in dashboard page



