Feature: Erudite enters incorrect data

  Scenario: Data have an incorrect format
    Given I started a game
    When I enter "1,2,3"
    Then I should see "Input must be of the form 'x,y'." once

  Scenario: Data are outside of the range

  Scenario: Data are not integers
