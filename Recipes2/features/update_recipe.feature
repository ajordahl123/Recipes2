Feature: Edit a Recipe
 As a foodie who originally posted a recipe
 So that I can update details of the recipe I posted
 I want to edit the details of the recipe I posted

 Background: the website already has some existing recipes to make
   Given these Recipes:
     | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level |
     | brownies        | Dessert   | no     | yes        |   no     | no         | American| oven      | make them good       | chocolate        | 30             | easy  |
     | cookies         | Dessert   | yes    | yes        |   yes    | yes        | French  |  oven     | cook for ten minutes | butter and flour | 20             | hard  |

 Scenario: Update an existing recipe
   Given I am on the recipes page
   When I fill in the following:

     | recipe_name    | brownies            |
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

   When I follow "brownies"
   Then I should see "Dessert"
   When I press "Edit recipe"
   And I fill in "Instructions" with "make 6"
   And I press "Save Changes"
   Then I should see "Instructions" with "make 6"
