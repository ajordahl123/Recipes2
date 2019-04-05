Feature: Edit a Recipe
 As a foodie who originally posted a recipe
 So that I can update details of the recipe I posted
 I want to edit the details of the recipe I posted

 Background: The user is already logged in and the website already has some existing recipes to make
   Given I am a new, authenticated user
   Given these Recipes:
     | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level | user_id | 
     | brownies        | Dessert   | no     | yes        |   no     | no         | American| oven      | make them good       | chocolate        | 30             | easy  | 1       |
     | cookies         | Dessert   | yes    | yes        |   yes    | yes        | French  |  oven     | cook for ten minutes | butter and flour | 20             | hard  | 1       |

 Scenario: Update an existing recipe
   Given I am on the recipes page
   When I follow "brownies"
   Then I should see "Dessert"
   And I should see "make them good"
   When I follow "Edit recipe" 
   And I fill in "Instructions" with "make 12"
   And I press "Save Changes"
   Then I should see "Instructions" with "make 12"
