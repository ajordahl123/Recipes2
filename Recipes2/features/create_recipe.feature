# good path

 Feature: Create a new Recipe
  As a foodie
  So that I can share my recipes with other users
  I want to be able to add new recipes

  Background: The user is already logged in and the website already has some existing recipe to make
    Given I am a new, authenticated user
    Given these Recipes:
      | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level | user_id |
      | brownies        | Dessert   | no     | yes        |   no     | no         | American| oven      | make them good       | chocolate        | 30             | easy  | 1       | 
      | cookies         | Dessert   | yes    | yes        |   yes    | yes        | French  |  oven     | cook for ten minutes | butter and flour | 20             | hard  | 1       |

  Scenario: Create a new recipe without specific image
    Given I am on the new recipe page
    When I fill in the following:

      | Recipe name    | cupcakes            |
      | Type of cuisine| American            |
      | Type of meal   | Dessert             |
      | This recipe is vegan          | no                  |
      | This recipe is vegetarian     | yes                 |
      | This recipe is nut free       | yes                 |
      | This recipe is dairy free     | yes                 |
      | Any special appliances needed      | oven                |
      | Instructions   | make 12             |
      | Ingredients required    | flour and chocolate |
      | Time to create, in minutes | 30                  |
      | Level of difficulty          | easy                |

    When I check "vegetarian"
    When I press "Create a new recipe"
    Then I should be on the create new recipe page
    And I should see "New recipe 'cupcakes' created successfully"
    And I should see that "cupcakes" has a level of "easy"

#sad_path
