class RecipesController < ApplicationController
    #user authentification before any action happens, except
    before_action :authenticate_user!, except: [:index, :show] #!!!!!
    def index
        # to access all recipes in the view
        # the following line throws uninitialized constant RecipesController::Recipe
        @recipes = Recipe.all
        if user_signed_in?
            @user = current_user.email
        else
            @user = nil
        end

        sort = params[:sort_by].to_s

        if sort == "rating"
          @recipes = Recipe.sort_by_rating.reverse
        elsif sort == "num_reviews"
        #   byebug
          @recipes = Recipe.sort_by_num_reviews.reverse # is an instance method, does it need to be an instance variable???
        elsif sort == "recent"
          @recipes = @recipes.order("created_at DESC")
        elsif sort == "level"
          @recipes = Recipe.sort_by_difficulty
        elsif sort == "duration"
          @recipes = Recipe.order("time_to_create")
        end

        # check filter conditions with session
        do_redirect, prefs = update_settings(params, session)
        if do_redirect
          flash.keep
          redirect_to recipes_path(prefs) and return
        end

        @recipe_name = prefs["recipe_name_filter"]
        @cuisine = prefs["cuisine_filter"]
        @meal_type = prefs["meal_type_filter"]
        @level = prefs["level_filter"]
        @time_to_create = prefs["time_to_create_filter"]
        @appliance = prefs["appliance_filter"]
        @vegetarian = prefs["vegetarian_filter"]
        @vegan = prefs["vegan_filter"]
        @nut_free = prefs["nut_free_filter"]
        @dairy_free = prefs["dairy_free_filter"]

        # Filtering
        if prefs != nil
            prefs.each do |key, value|
                @recipes = @recipes.public_send(key, value) if value.present?
            end
        end
    end

    def show
        @recipe = Recipe.find(params[:id])
        if user_signed_in?
            @user = current_user # to be passed into show view
            # user just favorited recipe
            if params[:favorited]
                @user.favorite_recipes << Recipe.where(:id => params[:id]) # adds the newly favorited recipe to the favorite recipes of that user
                @favorited = true
            # user just unfavorited recipe
            elsif params[:unfavorited] && ! (@user.favorite_recipes.where("recipe_id == ?", params[:id]).empty?)
                @user.favorite_recipes.delete(params[:id])
                @favorited = false
                params[:unfavorited] = false
            # user has previously favorited this recipe
            elsif ! (@user.favorite_recipes.where("recipe_id == ?", params[:id]).empty?)
                @favorited = true
            # user hasn't favorited this recipe
            else
                @favorited = false
            end
        # user isn't logged in
        else
            @user = nil
        end
    end

    def new
        @recipe = Recipe.new
        @recipe = current_user.recipes.build #!!!!!
    end

    def create
        @recipe= Recipe.new(create_update_params)
        @recipe= current_user.recipes.build(create_update_params) #!!!!!
        @recipe.user = current_user
        if @recipe.save
          flash[:notice] = "New recipe #{@recipe.recipe_name} created successfully"
          redirect_to recipes_path and return
        else
            # handled by pop-up notice. Cannot sumbit if any required fileds is not completed
        #   flash[:warning] = "New recipe could not be created. Please try again"
        #   redirect_to new_recipe_path and return
        end
    end

    def edit
        @recipe = Recipe.find(params[:id]) # get existing object
    end

    def update
        @recipe= Recipe.find(params[:id])
        if @recipe.update(create_update_params) #successful!
            flash[:notice] = "#{@recipe.recipe_name} successfully updated!"
            redirect_to recipe_path(@recipe)
        else 
            # handled by pop-up notice. Cannot sumbit if any required fileds is not completed
            # flash[:warning] = "Sorry, the recipe couldn't be updated. Please try again."
            # redirect_to edit_recipe_path(@recipe)
        end
    end

    def destroy
        @recipe= Recipe.find(params[:id])
        @recipe.destroy
        flash[:notice] = " #{@recipe.recipe_name} was deleted."
        redirect_to recipes_path
    end

    private
    def create_update_params
        params.require(:recipe).permit(:recipe_name, :meal_type, :vegan, :dairy_free, :nut_free, :vegetarian, :cuisine, :appliance, :ingredients, :time_to_create, :level, :instructions, :image)
    end
    def filtering_params(params)
        params.slice(:recipe_name_filter, :cuisine_filter, :level_filter, :meal_type_filter, :time_to_create_filter, :vegan_filter, :vegetarian_filter, :dairy_free_filter, :nut_free_filter, :appliance_filter)
    end

    def update_settings(parms, sess)
        preferences = session[:preferences] || Hash.new
        if parms[:reset_filters] #reset filter
          session.clear
          return true, Hash.new
        end
        should_redirect = false
        filtering_params(params).each do |key, value|
            if !value.present? # not currently set; look at session
                value = preferences[key]
                should_redirect = true
            elsif value != preferences[key]
                # filter is different from session; stick with current
                should_redirect = true
            end
            preferences[key] = value
        end
        session[:preferences] = preferences
        return should_redirect, preferences
    end
end
