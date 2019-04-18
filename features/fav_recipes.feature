 Feature: Favorite a Recipe 
   As a foodie
   So that I can keep track of which recipes I like
   I want to be able to favorite recipes

   Background: The user is already logged in and the website already has some existing recipe to make
     Given I am a new, authenticated user with email "user1@colgate.edu"
     Given there is an authenticated user with email "user2@colgate.edu"
     Given these Recipes:
       | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level | user_email      |
       | brownies        | Dessert   | no     | yes        |   no     | no         | American| oven      | make them good       | chocolate        | 30             | Easy  | user1@colgate.edu |
       | cookies         | Dessert   | yes    | yes        |   yes    | yes        | French  |  oven     | cook for ten minutes | butter and flour | 20             | Hard  | user2@colgate.edu |

   Scenario: Favorite and unfavorite a recipe
     Given I am on the recipes page
     When I follow "brownies"
     Then I should see "brownies"
     And I should see "Favorite this recipe"
     And I should see the image "fav_bw"
     When I follow "Favorite this recipe"
     Then I should see the image "fav_color1"
     When I follow "Back to recipe listing"
     And I follow "brownies"
     Then I should see "Unfavorite this recipe"
     When I follow "Unfavorite this recipe"
     Then I should see the image "fav_bw"
     