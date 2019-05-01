 Feature: Favorite a Recipe 
    As a foodie 
    So that I know whether people like my recipes 
    I want to be awarded recognition if my recipes are favorably reviewed


   Background: The user is already logged in and the website already has some existing recipe to make
    Given I am a new, authenticated user with email "testing@colgate.edu"
    Given these Recipes:
      | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level | user_email          |
      | brownies        | Dessert   | false  | true       |   false  | false      | American| oven      | make them good       | chocolate        | 30             | Easy  | testing@colgate.edu |
      | cookies         | Dessert   | true   | true       |   true   | true       | French  |  oven     | cook for ten minutes | butter and flour | 20             | Hard  | testing@colgate.edu |
    
    Given these Reviews:
      | user_email            | recipe   | stars     | text                    |
      | testing@colgate.edu   | brownies | 5         | Best dessert ever       |
      | testing@colgate.edu   | cookies  | 5         | Almost as good as mom's |
      | testing@colgate.edu   | cookies  | 4         | Not vegan, misleading   |

   Scenario: Recieve star chef if my ratings are high 
     When I am on the recipes page
     When I follow "Your Profile & Favorite Recipes"
     Then I should see "Chef Details"
     And I should see "Congradulations! You have recieved star chef status. This means your recipes are getting great reviews!"
 
    Given these Reviews:
      | user_email            | recipe   | stars     | text                    |
      | testing@colgate.edu   | brownies | 1         | Digusting               |
      | testing@colgate.edu   | cookies  | 2         | do not make             |
      | testing@colgate.edu   | cookies  | 2         | Not vegan, misleading   |
     When I am on the recipes page
     When I follow "Your Profile & Favorite Recipes"
     Then I should see "Chef Details"
     And I should see "You have not yet recieved star chef status yet."