Feature: Erudite enters incorrect data

  Scenario: Data have an incorrect format
    Given I started a game
    When I enter "1,2,3"
    Then I should see "Input must be of the form 'x,y'." once

  Scenario: X coordinate is less than 1
    Given I started a game
    When I enter "0,1"
    Then I should see "Each coordinate must be between 1 and 5." once

  Scenario: X coordinate is greater than 5
    Given I started a game
    When I enter "6,1"
    Then I should see "Each coordinate must be between 1 and 5." once

  Scenario: Y coordinate is less than 1
    Given I started a game
    When I enter "1,0"
    Then I should see "Each coordinate must be between 1 and 5." once

  Scenario: Y coordinate is greater than 5
    Given I started a game
    When I enter "1,6"
    Then I should see "Each coordinate must be between 1 and 5." once

  Scenario: Data are not integers
