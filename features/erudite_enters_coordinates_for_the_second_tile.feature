Feature: Erudite enters coordinates for the second tile

  Scenario: Enter coordinates for the second tile
    Given I started a game
    And I entered coordinates for the first tile
    When I enter coordinates for the second tile
    Then I should see "Please, enter coordinates for the first tile." twice
