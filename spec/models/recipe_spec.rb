require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "check attributes and methods" do
    it "should be able to create a Recipe object which has the correct methods on it" do
      r = Recipe.create!(recipe_name: "Brownies", meal_type: 'Dessert', vegan:'true', vegetarian: 'true', nut_free: 'false',dairy_free: 'false', cuisine: 'French', appliance: 'tetsing', instructions: 'testing', ingredients: 'testing',time_to_create: '17', level: 'Medium', user_id: 2)
      expect(r).to respond_to :recipe_name
      expect(r).to respond_to :meal_type
      expect(r).to respond_to :vegan
      expect(r).to respond_to :vegetarian
      expect(r).to respond_to :nut_free
      expect(r).to respond_to :dairy_free
      expect(r).to respond_to :cuisine
      expect(r).to respond_to :appliance
      expect(r).to respond_to :ingredients
      expect(r).to respond_to :instructions
      expect(r).to respond_to :level
      expect(r).to respond_to :time_to_create
      expect(r).to respond_to :user_id
      #expect(Recipe).to respond_to :filter_on_constraints
    end
  end  

  it "should fail to create a Recipe object if the instructions are not specified" do
      expect {
        Recipe.create!(recipe_name: "Brownies", meal_type: 'Dessert', vegan:'true', vegetarian: 'true', nut_free: 'false',dairy_free: 'false', cuisine: 'French', appliance: 'tetsing', instructions: '', ingredients: 'testing',time_to_create: '17', level: 'Medium', user_id: 2)}.to raise_exception ActiveRecord::RecordInvalid
  end
end
