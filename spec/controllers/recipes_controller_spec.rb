require 'rails_helper'
require 'simplecov'
SimpleCov.start

RSpec.describe RecipesController, type: :controller do
    include Devise::Test::ControllerHelpers
    context "root route" do
        it "routes to recipes#index" do
            expect(:get => '/').to route_to(:controller => 'recipes', :action => 'index')
        end
    end

    context "index" do
        it "routes correctly" do
            get :index
            expect(response.status).to eq(200)
        end

        # it "renders the index template and does default sorting" do
        #     x, y = RentalProperty.create!(latitude: 0, longitude: 0), RentalProperty.create!(latitude: 0, longitude: 0)
        #     get :index
        #     expect(assigns(:properties)).to match_array([x,y])
        #     expect(response).to render_template("index")
        # end
    end

    context "show" do
        it "routes correctly" do
            #recipe_name: 'testing', meal_type: 'Dessert', vegan:'true', vegetarian: 'true', nut_free: 'false',dairy_free: 'false', cuisine: 'French', appliance: 'tetsing', instructions: 'testing', ingredients: 'testing',time_to_create: '17', level: 'Medium', user_id: 2, :image => File.open("app/assets/images/spaghetti.jpg",'r'))
            r = Recipe.new(recipe_name: "Brownies", meal_type: 'Dessert', vegan:'true', vegetarian: 'true', nut_free: 'false',dairy_free: 'false', cuisine: 'French', appliance: 'tetsing', instructions: 'testing', ingredients: 'testing',time_to_create: '17', level: 'Medium', user_id: 2)
            expect(Recipe).to receive(:find).with(eq("1").or eq(1)) { r }
            get :show, :params => { :id => 1 }
            expect(response.status).to eq(200)
        end
    end
end
