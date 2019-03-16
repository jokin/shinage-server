@registration
Feature: As an interested user
  In order to use the system
  I want to be able to register

  Scenario: I can register with a registration code
    Given There is a registration code "code123456789"
    When I am on page "/register"
    And I fill the field "form[registrationCode]" with "code123456789"
    And I fill the field "form[email]" with "testusername1@test.test"
    And I fill the field "form[password][first]" with "testpassword"
    And I fill the field "form[password][second]" with "testpassword"
    And I click on the button "form[save]"
    Then I should see that the registration was successful

  Scenario: I cannot register with a wrong registration code
    Given There is a registration code "code1"
    When I am on page "/register"
    And I fill the field "form[registrationCode]" with "wrong_code"
    And I fill the field "form[email]" with "testusername1@test.test"
    And I fill the field "form[password][first]" with "testpassword"
    And I fill the field "form[password][second]" with "testpassword"
    And I click on the button "form[save]"
    Then I should see that the registration was not successful

  Scenario: I cannot register multiple time with the same registration code
    Given There is a registration code "code123456789"
    When I am on page "/register"
    And I fill the field "form[registrationCode]" with "code123456789"
    And I fill the field "form[email]" with "testusername1@test.test"
    And I fill the field "form[password][first]" with "testpassword"
    And I fill the field "form[password][second]" with "testpassword"
    And I click on the button "form[save]"
    And I am on page "/register"
    And I fill the field "form[registrationCode]" with "code123456789"
    And I fill the field "form[email]" with "testusername2@test.test"
    And I fill the field "form[password][first]" with "testpassword"
    And I fill the field "form[password][second]" with "testpassword"
    And I click on the button "form[save]"
    Then I should see that the registration was not successful
