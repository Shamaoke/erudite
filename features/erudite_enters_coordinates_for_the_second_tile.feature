Feature: Erudite enters coordinates for the second tile

  Scenario: Enter coordinates for the second tile
    Given I started a game
    And I entered "1,2"
    When I enter "4,5"
    Then I should see "Please, enter coordinates for the first tile." twice
