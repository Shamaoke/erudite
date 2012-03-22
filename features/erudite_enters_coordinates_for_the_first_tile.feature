Feature: Erudite enters coordinates for the first tile

  Scenario: Enter coordinates for the first tile
    Given I started a game
    When I enter "1,2"
    Then I should see "Please, enter coordinates for the second tile." once
