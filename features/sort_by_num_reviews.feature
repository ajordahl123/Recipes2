# good path

 Feature: Sort by number of reviews
 As a foodie
 So that I can see the most-reviewed recipe
 I want to sort by the highest number of reviews

  Background: The user is already logged in and the website already has some existing recipe to make
    Given I am a new, authenticated user with email "testing@colgate.edu"
    Given there is an authenticated user with email "otheruser@colgate.edu"
    Given these Recipes:
      | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level | user_email           |
      | brownies        | Dessert   | no     | yes        |   no     | no         | American| oven      | make them good       | chocolate        | 30             | Easy  | otheruser@colgate.edu  |
      | cookies         | Dessert   | yes    | yes        |   yes    | yes        | French  |  oven     | cook for ten minutes | butter and flour | 20             | Hard  | testing@colgate.edu  |

    Given these Reviews:
      | user_email            | recipe   | stars     | text                    |
      | testing@colgate.edu   | brownies | 5         | Best dessert ever       |
      | testing@colgate.edu   | cookies  | 5         | Almost as good as mom's |
      | otheruser@colgate.edu | cookies  | 1         | Not vegan, misleading   |

  Scenario: Sort by rating
    Given I am on the recipes page
    And I follow "Num. of Reviews"
    Then "COOKIES" should appear before "BROWNIES"