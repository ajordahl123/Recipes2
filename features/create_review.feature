# good path

 Feature: Create a new Review
 As a foodie
 So that I can leave feedback for a recipe
 I want to be able to leave reviews for recipes

  Background: The user is already logged in and the website already has some existing recipe to make
    Given I am a new, authenticated user with email "testing@colgate.edu"
    Given there is an authenticated user with email "user2@colgate.edu"
    Given there is an authenticated user with email "bobama@colgate.edu"
    Given these Recipes:
      | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level | user_email           |
      | brownies        | Dessert   | false  | true       |   false  | false      | American| oven      | make them good       | chocolate        | 30             | Easy  | user2@colgate.edu    |
      | cookies         | Dessert   | true   | true       |   true   | true       | French  | oven      | cook for ten minutes | butter and flour | 20             | Hard  | testing@colgate.edu  |
      | chip cookies    | Dessert   | false  | true       |   true   | false      | American| oven      | yummy yummy          | chocolate        | 25             | Medium| bobama@colgate.edu   |

  Scenario: Create a new review
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

    Scenario: Create a new review with an image
      Given I am on the recipes page
      And I follow "CHIP COOKIES"
      Then I should see "Dessert"
      And I should see "yummy yummy"
      When I follow "Write a review"
      And I fill in the following:

        |Rating         | 5         |
        |Review text    | Wonderful!|

      And I attach the file "app/assets/images/chocolatechipcookie.jpg" to "Image"
      And I press "Create new review"
      Then I should see "See What Other People Think About This Recipe..."
      And I should see that "testing@colgate.edu" gave the recipe a rating of "5"
      Then I should see the image "chocolatechipcookie.jpg"

#sad path
  Scenario: Create a new review without text
    Given I am on the recipes page
    And I follow "BROWNIES"
    Then I should see "Dessert"
    When I follow "Write a review"
    And I fill in the following:

      |Rating         | 4         |

    And I press "Create new review"
    Then I should be on the new review for recipe 1 page
