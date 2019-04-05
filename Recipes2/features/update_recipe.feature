Feature: Edit a Recipe
 As a foodie who originally posted a recipe
 So that I can update details of the recipe I posted
 I want to edit the details of the recipe I posted

 Background: The user is already logged in and the website already has some existing recipes to make
   Given I am a new, authenticated user
   Given these Recipes:
     | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level |
     | brownies        | Dessert   | no     | yes        |   no     | no         | American| oven      | make them good       | chocolate        | 30             | easy  |
     | cookies         | Dessert   | yes    | yes        |   yes    | yes        | French  |  oven     | cook for ten minutes | butter and flour | 20             | hard  |

 Scenario: Update an existing recipe
   Given I am on the recipes page
   When I fill in the following:

     | Recipe name    | brownies            |
     | Type of meal   | Dessert             |
     | This recipe is vegan          | no                  |
     | This recipe is vegetarian     | yes                 |
     | This recipe is nut free       | yes                 |
     | This recipe is dairy free     | yes                 |
     | Type of cuisine| American            |
     | Any special appliances needed      | oven                |
     | Instructions   | make 12             |
     | Ingredients required    | flour and chocolate |
     | Time to create, in minutes | 30                  |
     | Level of difficulty          | easy                |

   When I follow "brownies"
   Then I should see "Dessert"
   When I press "Edit recipe"
   And I fill in "Instructions" with "make 6"
   And I press "Save Changes"
   Then I should see "Instructions" with "make 6"
