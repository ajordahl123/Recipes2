# good path

 Feature: Create a new Recipe
  As a foodie
  So that I can share my recipes with other users
  I want to be able to add new recipes

  Background: the website already has some existing recipe to make
    Given these Recipes:
      | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level |
      | brownies        | Dessert   | no     | yes        |   no     | no         | American| oven      | make them good       | chocolate        | 30             | easy  |
      | cookies         | Dessert   | yes    | yes        |   yes    | yes        | French  |  oven     | cook for ten minutes | butter and flour | 20             | hard  |

  Scenario: Create a new recipe without specific image
    Given I am on the create new recipe page
    When I fill in the following:

      | recipe_name    | cupcakes            |
      | meal_type      | Dessert             |
      | vegan          | no                  |
      | vegetarian     | yes                 |
      | nut_free       | yes                 |
      | dairy_free     | yes                 |
      | cuisine        | American            |
      | appliance      | oven                |
      | instructions   | make 12             |
      | ingredients    | flour and chocolate |
      | time_to_create | 30                  |
      | level          | easy                |

    When I check "vegetarian"
    When I press "Create a new recipe"
    Then I should be on the create new recipe page
    And I should see "New recipe 'cupcakes' created successfully"
    And I should see that "cupcakes" has a level of "easy"

#bad_path
