Feature: Creating parking violations
  As an angry developer
  I want to record parking violations for our spots
  So that justice can be served

  Background:
    Given I am on the home page

  Scenario: Creating a parking violation for a new, non-office car
    Then I should see the parking violation form

