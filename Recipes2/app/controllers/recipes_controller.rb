class RecipesController < ApplicationController
    #user authentification before any action happens, except
    before_action :authenticate_user!, except: [:index, :show]
    def index
        # to access all recipes in the view
        # the following line throws uninitialized constant RecipesController::Recipe
        @recipes = Recipe.all
        if user_signed_in?
            @user = current_user.email
        else
            @user = nil
        end    
        
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        #@recipe = Recipe.new
        @recipe = current_user.recipes.build
    end

    def create
        #@recipe= Recipe.new(create_update_params)
        @recipe= current_user.recipes.build(create_update_params)
        if @recipe.save
          flash[:notice] = "New recipe #{@recipe.recipe_name} created sucessfully"
          redirect_to recipe_path(@recipe) and return
        else
          flash[:warning] = "New recipe could not be created. Please try again"
          redirect_to new_recipe_path and return
        end
    
    end
    
    def edit
        @recipe = Recipe.find(params[:id]) # get existing object
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
