# good path

 Feature: Create a new Review
 As a foodie
 So that I can leave feedback for a recipe
 I want to be able to leave reviews for recipes

  Background: The user is already logged in and the website already has some existing recipe to make
    Given I am a new, authenticated user with email "testing@colgate.edu"
    Given there is an authenticated user with email "user2@colgate.edu"
    Given these Recipes:
      | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level | user_email           |
      | brownies        | Dessert   | false  | true       |   false  | false      | American| oven      | make them good       | chocolate        | 30             | easy  | user2@colgate.edu  |
      | cookies         | Dessert   | true   | true       |   true   | true       | French  |  oven     | cook for ten minutes | butter and flour | 20             | hard  | testing@colgate.edu  |

  Scenario: Create a new review without images
    Given I am on the recipes page
    And I follow "BROWNIES"
    Then I should see "Dessert"
    And I should see "make them good"
    When I follow "Write a review"
    And I fill in the following:

      |Rating         | 4         |
      |Review text    | Yummy!    |

    And I press "Create new review"
    Then I should see "See What Other People Think About This Recipe..."
    And I should see that "testing@colgate.edu" gave the recipe a rating of "4"
