class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    @user= User.find(params[:id])
    if @user.update(create_update_params) #successful!
        # flash[:notice] = "#{@recipe.recipe_name} successfully updated!"
        redirect_to recipe_path(@user)
    else # unsucessful
        # flash[:warning] = "Sorry, the recipe couldn't be updated. Please try again."
        redirect_to edit_recipe_path(@user)
    end
end

private
    def create_update_params
        params.require(:user).permit(:username, :first, :string, :image)
    end

end
