# good path

 Feature: Create a new Recipe
  As a foodie
  So that I can share my recipes with other users
  I want to be able to add new recipes

  Background: The user is already logged in and the website already has some existing recipe to make
    Given I am a new, authenticated user with email "testing@colgate.edu"
    Given these Recipes:
      | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level | user_email           |
      | brownies        | Dessert   | false  | true       |   false  | false      | American| oven      | make them good       | chocolate        | 30             | Easy  | testing@colgate.edu  |
      | cookies         | Dessert   | true   | true       |   true   | true       | French  |  oven     | cook for ten minutes | butter and flour | 20             | Hard  | testing@colgate.edu  |
  
  Scenario: Create a new recipe without specific image
    Given I am on the new recipe page
    When I fill in the following:

      | Recipe name                     | cupcakes            |
      | Type of cuisine                 | American            |
      | Any special appliances needed   | oven                |
      | Instructions                    | make 12             |
      | Ingredients required            | flour and chocolate |
      | Time to create, in minutes      | 30                  |

    And I select "Dessert" from "Type of meal"
    And I check "This recipe is vegetarian"
    And I check "This recipe is nut free"
    And I check "This recipe is dairy free"
    When I check "vegetarian"
    And I select "Easy" from "Level of difficulty"
    When I press "Create a new recipe"
    And I should see "New recipe cupcakes created successfully"
    And I should be on the recipes page


#sad path
  Scenario: Create a new recipe without instructions
      Given I am on the new recipe page
    When I fill in the following:

      | Recipe name                     | cupcakes            |
      | Type of cuisine                 | American            |
      | Any special appliances needed   | oven                |
      | Ingredients required            | flour and chocolate |
      | Time to create, in minutes      | 30                  |

    And I select "Dessert" from "Type of meal"
    And I check "This recipe is vegetarian"
    And I check "This recipe is nut free"
    And I check "This recipe is dairy free"
    When I check "vegetarian"
    And I select "Easy" from "Level of difficulty"
    When I press "Create a new recipe"
    Then I should be on the new recipe page

