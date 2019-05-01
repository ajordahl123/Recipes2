class UsersController < ApplicationController

  def show
    update_star_chef_status
  end 
  
  def new
    # devise handles this
    #@user = User.new
  end

  def update
    @user= User.find(params[:id])
    if @user.update(create_update_params) #successful!
        # flash[:notice] = "#{@recipe.recipe_name} successfully updated!"
        redirect_to user_path(@user)
    else # unsucessful
        # flash[:warning] = "Sorry, the recipe couldn't be updated. Please try again."
        redirect_to edit_user_path(@user)
    end
end

private
    def create_update_params
        params.require(:user).permit(:username, :first, :string, :image)
    end

    def update_star_chef_status
      @user = User.find(params[:id])
    
      @star = 0 
      @count = 0
      @chefstatus = 0
      @numofreviews = 0
      @user.recipes.each do |r|
        @count = @count + 1 
          r.reviews.each do |rr|
          @numofreviews = @numofreviews + 1
          @star = @star + rr.stars
          end
      end
      if @count != 0 &&  @numofreviews != 0 && (@star/@numofreviews)/@count >= 4
        @chefstatus = 1
      else
        @chefstatus = 0
      end 
    end 
end