Feature: manage week goals

  As a week map user
  I want to manage the goals for my week
  So I can keep track of my objectives

  @javascript
  Scenario: View goals list
    Given the following goals for the current week exists:
    | description                   |
    | finish project first feature  |
    | work out at least 3 day       |
    When I go to the current week
    Then I can see the list of goals:
    | description                   |
    | finish project first feature  |
    | work out at least 3 day       |