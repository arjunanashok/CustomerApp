Feature: As a "TheCurrency Cloud" User I would  like to send my password details
  in forgot password page

  Background:
    Given I am in login page
    Given I navigate to "forgot_password" page

  Scenario: User confirms login id is mandatory
    When I submit the details in "forgot_password" page
    Then am shown "Please Enter Login ID" message in "forgot_password" page

  Scenario: User confirms email sent message
    Given I have submitted my user details "prod-tester@rabbitfx.com"
    When I submit the details in "forgot_password" page
    Then am shown "You will receive an email to reset your security details" message in "forgot_password" page