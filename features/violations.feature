Feature: Creating parking violations
  As an angry developer
  I want to record parking violations for our spots
  So that justice can be served

  Background:
    Given I am on the home page

  Scenario: Creating a parking violation for a new, non-office car
    When I click the "New violation" link
    Then I should be on the new violation page
      And I should see the parking violation form
    When I fill out the violation form for the new car
      And I click the "Create violation" button
    Then the new car should have been created
      And the new car should have "1" parking violation
      And I should be editing the new car
      And I should see a success message

  Scenario: Creating a parking violation for an existing car 
    Given there is a car
      And the car already has a violation
    When I click the "New violation" link
    Then I should be on the new violation page
      And I should see the parking violation form
    When I fill out the violation form for the existing car
      And I click the "Create violation" button
    Then the existing car should have "2" parking violations
      And I should be on the violations page
      And I should see a success message
