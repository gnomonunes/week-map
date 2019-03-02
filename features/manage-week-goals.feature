Feature: manage week goals

  As a week map user
  I want to manage the goals for my week
  So I can keep track of my objectives

  Background:
    Given the following goals for the current week exists:
    | description                     |
    | finish project's first feature  |
    | work out at least 3 days        |

  @javascript
  Scenario: View week goals list
    When I go to the current week
    Then I can see the list of goals:
    | description                     |
    | finish project's first feature  |
    | work out at least 3 day         |

  @javascript
  Scenario: Add new week goal
    Given I am looking at the current week
    Then I can see a form to add a new goal
    And when I fill the description field with 'do the laundry'
    And click 'Add'
    Then I see 'do the laundry' in the goals list

  @javascript
  Scenario: Delete a goal
    Given I am looking at the current week
    Then I can see a button to delete each goal
    And when I click the delete button for 'work out at least 3 days'
    Then I don't see 'work out at least 3 days' in the goals list
