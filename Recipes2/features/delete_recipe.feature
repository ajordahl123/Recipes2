Feature: Delete existing rental property
  As a foodie
  So that I can get rid of a recipe I don't like anymore
  I want to delete a recipe I previously created

  Background: the website already has some existing recipes
  | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level |
  | brownies        | Dessert   | no     | yes        |   no     | no         | American| oven      | make them good       | chocolate        | 30             | easy  |

  Scenario: Delete an existing recipe
  Given I am a new, authenticated user
  Given I am on the recipes page
  When I follow "brownies"
  Then I should see "Delete recipe"
  When I follow "Delete recipe"
  Then I should be on the recipes page
  And I should see "brownies was deleted"
