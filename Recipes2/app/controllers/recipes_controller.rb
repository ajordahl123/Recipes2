class RecipesController < ApplicationController
    #before_action :authenticate_user! #user authentification before any action happens
    def index
        # to access all recipes in the view
        # the following line throws uninitialized constant RecipesController::Recipe
        #@recipes = Recipe.all
        if user_signed_in?
            @user = current_user.email
        else
            @user = nil
        end    
    end

    def show
        @recipe = Recipe.find(params[:id])
    end


    # NOTE: see HW4 code for guidance with the following:

    # def new
    #     @blank_recipe = Recipe.new
    # end

    # def create

    # end

    # def update

    # end

    # def destroy

    # end
end
