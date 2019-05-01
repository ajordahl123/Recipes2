Feature: Edit your profile
    As a foodie
    So that I can edit my profile information
    I want to edit my profile and change my account email and picture

Background: The user is already logged in
  Given I am a new, authenticated user with email "testing@colgate.edu"

  Scenario: Update an existing user profile
    When I am on the recipes page
    When I follow "Your Profile & Favorite Recipes"
    Then I should see "Chef Details"
    And I should see the image "default_user"
    When I follow "Edit your profile picture"
    And I attach the file "chef.jpg" to "Upload a new profile picture"
    And I press "Save Changes"
    Then I should see the image "chef"
