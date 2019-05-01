class RecipesController < ApplicationController
    #user authentification before some actions happen
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @recipes = Recipe.all
        @user = set_user

        #sort recipes
        sort = params[:sort_by].to_s
        sort_recipes(sort)

        # check filter conditions with session
        do_redirect, prefs = update_settings(params, session)
        if do_redirect
          flash.keep
          redirect_to recipes_path(prefs) and return
        end

        #maintain filtered values
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
        favoriting_recipes # (un)favorite recipes if favoriting status was just changed
        update_star_chef_status
    end

    def new
        @recipe = Recipe.new
        #@recipe = current_user.recipes.build 
    end

    def create
        @recipe= Recipe.new(create_update_params)
        #@recipe= current_user.recipes.build(create_update_params)
        @recipe.user = current_user
        if @recipe.save
          flash[:notice] = "New recipe #{@recipe.recipe_name} created successfully"
          redirect_to recipes_path and return
        else
          # with validation in model
          #render 'new'
          redirect_to new_recipe_path
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
            # with validation in model
            # render 'edit'
            redirect_to edit_recipe_path(@recipe)
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
    def set_user
        if user_signed_in?
            @user = current_user.email
        else
            @user = nil
        end
    end    
    def filtering_params(params)
        params.slice( :recipe_name_filter, :cuisine_filter, :level_filter, :meal_type_filter, :time_to_create_filter, :appliance_filter, :vegan_filter, :vegetarian_filter, :dairy_free_filter, :nut_free_filter)
    end

    def update_settings(parms, sess)
        preferences = session[:preferences] || Hash.new
        if parms[:reset_filters] #reset filter
          session.clear
          return true, Hash.new
        end
        should_redirect = false 
        check_boxes = ["vegetarian_filter","vegan_filter","nut_free_filter","dairy_free_filter"]
        filtering_params(params).each do |key, value|
            # handle checkbox values first
            if check_boxes.include? key
                if value != preferences[key]
                    should_redirect = true  
                end
                preferences[key] = 'true'  
            else    
                if !value.present? # not currently set; look at session
                    value = preferences[key]
                    should_redirect = true
                elsif value != preferences[key]
                    # filter is different from session; stick with current
                    should_redirect = true
                end
                preferences[key] = value
            end    
        end
        session[:preferences] = preferences
        return should_redirect, preferences
    end
    def sort_recipes(sort)
        if sort == "rating"
            @recipes = Recipe.sort_by_rating.reverse
        elsif sort == "num_reviews"
            @recipes = Recipe.sort_by_num_reviews.reverse
        elsif sort == "recent"
            @recipes = @recipes.order("created_at DESC")
        elsif sort == "level"
            @recipes = Recipe.sort_by_difficulty
        elsif sort == "duration"
            @recipes = Recipe.order("time_to_create")
        end
    end

    def favoriting_recipes 
        if user_signed_in?
            @user = current_user # to be passed into show view
            # user just favorited recipe
            if params[:favorited]
                # adds the newly favorited recipe to the favorite recipes of that user
                @user.favorite_recipes << Recipe.where(:id => params[:id]) 
                @favorited = true
            # user just unfavorited recipe
            elsif params[:unfavorited] && ! (@user.favorite_recipes.where("recipe_id == ?", params[:id]).empty?)
                # remove recipe from the user's favorites list
                @user.favorite_recipes.delete(params[:id])
                @favorited = false
                params[:unfavorited] = false
            # user has previously favorited this recipe
            elsif ! (@user.favorite_recipes.where("recipe_id == ?", params[:id]).empty?)
                # passed to view so the correct message will be shown
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

    def update_star_chef_status
        @recipe = Recipe.find(params[:id])
        
        @star = 0 
        @count = 0
        @numofreviews = 0
        @chefstatus = 0
        allrecipes = Recipe.where("user_id == ?", @recipe.user.id)
        allrecipes.each do |r|
            @count = @count + 1 
            # count the number of reviews for recipes by this user, and the total num stars it's received
            r.reviews.each do |rr|
                @numofreviews = @numofreviews + 1
                @star = @star + rr.stars
            end
        end

        # if average stars for this recipe are 4, give star chef status
        if @count != 0 &&  @numofreviews != 0 && (@star/@numofreviews)/@count >= 4
            @chefstatus = 1
        else
            @chefstatus = 0
        end 

        # if @recipe.user.recipes.length > 0 && @recipe.user.recipes.average("stars") > 4 
        #     @chefstatus = 1
        # else
        #     @chefstatus = 0
        # end

    end
end
