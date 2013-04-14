Feature: Document a violation
  As a Getty Employee
  In order to document violators
  I want to upload a photo to the wall of shame

  Background:
    Given I am on the home page

  Scenario: Upload a photo
    When I click the "New violation" link
    Then I should be on the new violation page
    And I should see the parking violation form
    When I fill out the violation form for the new car
    And I upload a photo
    And I click the "Create violation" button
    Then I should see the violation details


