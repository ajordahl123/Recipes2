class RecipesController < ApplicationController
    before_action :authenticate_user! #devise, user authentification
    def index
        # to access all recipes in the view
        # the following line throws uninitialized constant RecipesController::Recipe
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe= Recipe.new(create_update_params)

        if @recipe.save
          flash[:notice] = "New recipe #{@recipe.recipe_name} created sucessfully"
          redirect_to recipe_path(@recipe) and return
        else
          flash[:warning] = "New recipe could not be created. Please try again"
          redirect_to new_recipe_path and return
        end
    
    end

    def update
        @recipe= Recipe.find(params[:id])
        @recipe.update(create_update_params)
        flash[:notice] = "#{@recipe.recipe_name}"
        redirect_to recipe_path(@recipe)
      end

    def destroy
        @recipe= Recipe.find(params[:id])
        @recipe.destroy
        flash[:notice] = " #{@recipe.recipe_name} was deleted."
        redirect_to recipes_path
    end

    private
    def create_update_params
        params.require(:recipe).permit(:recipe_name, :meal_type, :vegan, :dairy_free, :nut_free, :vegetarian, :cuisine, :appliance, :ingredients, :timetocreate, :level)
      end
end
