Feature: Create Account

Scenario: Visit Profile Page
 When I am on the recipes page
 When I follow "Login"
 When I follow "Sign up"
 When I fill in the following:

   | Email                            | test@colgate.edu            |
   | Password                         | secretpass                  |
   | Password confirmation            | secretpass                  |

 And press "Join Recipe Today!"
 Then I should be on the root page
 And I should see "Welcome! You have signed up successfully."
