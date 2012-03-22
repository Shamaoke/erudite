Feature: Erudite starts a game

  Scenario: Starting a game
    When I start a game
    Then I should see "Welcome to Erudite!" once
    And I should see "Please, enter coordinates for the first tile." once
