Feature: Erudite enters coordinates for the first tile

  Scenario: Enter coordinates for the first tile
    Given I started a game
    When I enter coordinates for the first tile
    Then I should see "Please, enter coordinates for the second tile."
