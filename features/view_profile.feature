Feature: View Profile
 As a foodie
 So that I can keep track of my information
 I want to be able to visit my profile

Background: The user is already logged in
 Given I am a new, authenticated user with email "testing@colgate.edu"

Scenario: Visit Profile Page
 When I am on the recipes page
 When I follow "View Profile"
 Then I should see "Chef Details"
