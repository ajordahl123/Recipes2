require 'rails_helper'
RSpec.describe "index page", type: :feature do
    before :each do
      visit "/recipes"
      User.create!(:email => 'testing@gmail.com',:password => '1234567',:username => 'Robert', :first => 'Hello', :last => 'Hola')
      #Recipe.create!(:recipe_name => "Sushi", :meal_type => "Dinner", :vegan => 'no', :vegetarian => 'no', :nut_free => 'yes', :dairy_free => 'yes', :cuisine => 'Japanese', :appliance =>'',:instructions => 'Put things on rice', :ingredients => 'rice, fish, soy sauce, wasabi', :time_to_create => '20',:level => 'Easy', :user_id => 1)
      click_link "Login"
      fill_in "Email",  with:  "testing@gmail.com"
      fill_in "Password",  with: "1234567"
      click_button "Log in" 
    end
    it "should fail to create a new recipe if cuisine is not specified" do
      expect(page).to have_link("Create a new recipe")
      click_link("Create a new recipe")
      fill_in "Type of cuisine", :with => ""
      fill_in "Recipe name", :with => "newone"
      
      select "Dinner", :from => "Type of meal"
      #check "This recipe is vegetarian"
      #check "This recipe is vegan"
      check "This recipe is nut free"
      check "This recipe is dairy free"
      fill_in "Time to create, in minutes", :with => '10'
      fill_in "Any special appliances needed", :with => "testing"
      fill_in "Ingredients required", :with => "testing"
      fill_in "Instructions", :with => "testing"
      select "Easy", :from => "Level of difficulty"
      click_button "Create a new recipe"
      visit "/recipes"

      names = []
      page.all(".recipe_name").each { |x| names << x.text }
      expect(names.length).to eq(1)
    end
end