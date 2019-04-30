Feature: Sign Out
 As a foodie
 So that I can keep my information safe
 I want to be able to sign out

Background: The user is already logged in
 Given I am a new, authenticated user with email "testing@colgate.edu"

Scenario: Visit Profile Page
 When I am on the recipes page
 When I follow "Logout"
 Then I should see "Signed out successfully"
 And I should see "Login"
