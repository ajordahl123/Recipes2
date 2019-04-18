# good path

 Feature: Sort by duration
 As a foodie
 So that I can see how long a recipe takes to create
 I want to sort by time to create the recipe

  Background: The user is already logged in and the website already has some existing recipe to make
    Given I am a new, authenticated user with email "testing@colgate.edu"
    Given these Recipes:
      | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level | user_email           |
      | brownies        | Dessert   | no     | yes        |   no     | no         | American| oven      | make them good       | chocolate        | 30             | easy  | otheruser@colgate.edu  |
      | cookies         | Dessert   | yes    | yes        |   yes    | yes        | French  |  oven     | cook for ten minutes | butter and flour | 20             | hard  | testing@colgate.edu  |

  Scenario: Sort by duration
    Given I am on the recipes page
    And I follow "Ready In"
    Then "cookies" should appear before "brownies"
