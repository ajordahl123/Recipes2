Feature: Filter recipes
  As a foodie
  so that I can find homes that meet my needs
  I want to be able to filter recipes

  Background: The user is already logged in and the website already has some existing recipe to make
  Given I am a new, authenticated user with email "user1@colgate.edu"
  Given these Recipes:
    | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level | user_email      |
    | brownies        | Dessert   | false  | true       |   false  | false      | American| oven      | make them good       | chocolate        | 30             | Easy  | user1@colgate.edu |
    | cookies         | Dessert   | true   | true       |   true   | true       | French  |  oven     | cook for ten minutes | butter and flour | 20             | Hard  | user2@colgate.edu |

  Scenario: filter by name
    When I go to the recipes page
    And I fill in "Recipe name" with "brownies"
    And I press "Refine the list of recipes"
    Then I should be on the recipes page
    And I should see "BROWNIES"
    But I should not see "COOKIES"

  Scenario: filter by level of difficulty
    When I go to the recipes page
    And I select "Easy" from "Level of difficulty" 
    And I press "Refine the list of recipes"
    Then I should be on the recipes page
    And I should see "BROWNIES"
    But I should not see "COOKIES"
    When I follow "Clear out filter settings"
    Then I should see "BROWNIES"
    And I should see "COOKIES"

  Scenario: filter by session's nut_free
   When I go to the recipes page
   And I check "Nut free"
   And I press "Refine the list of recipes"
   Then I should see "COOKIES"
   And I should not see "BROWNIES"
   And I select "Hard" from "Level of difficulty" 
   And I press "Refine the list of recipes"
   Then I should see "COOKIES"
   And I should not see "BROWNIES"