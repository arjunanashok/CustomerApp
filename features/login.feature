Feature: As a "TheCurrency Cloud" User I would like to login
  into Customer App so that I can use existing functionality like
  book trade, add beneficiary and view balance in my account.

  Background:
    Given I am in login page

  Scenario: user confirms login id is mandatory
    When I submit login details
    Then am shown "Please Enter Login ID" message in "login" page

  Scenario: user confirms password is mandatory
    Given I have entered userid "prod-tester@rabbitfx.com"
    When I submit login details
    Then am shown "Please Enter Password" message in "login" page


  Scenario: user confirms security answer is mandatory
    Given I have entered userid "prod-tester@rabbitfx.com"
    And I have entered password "test"
    When I submit login details
    Then am shown "Please Enter Security Answer" message in "login" page
#
  Scenario: user confirms authentication message
    Given I have entered userid "prod-tester@rabbitfx.com"
    And I have entered password "testing"
    And I have entered security answer "testing"
    When I submit login details
    Then am shown "Authentication failed with the supplied credentials" message in "login" page

  Scenario: user successfully logins in customer app
    Given I have entered userid "prod-tester@rabbitfx.com"
    And I have entered password "test"
    And I have entered security answer "test"
    When I submit login details
    Then am in dashboard page


  Scenario: User navigates to forgot password page
    When  I select forgot password
    Then  am in "forgot password" page





