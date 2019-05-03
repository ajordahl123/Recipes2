class UsersController < ApplicationController

  def show
    update_star_chef_status
  end 
  
  def new
    # devise handles this
  end

  def edit
    @user= User.find(params[:id])
  end  
  
  def update
    @user= User.find(params[:id])
    @user.update(create_update_params)
    if @user.save
        redirect_to user_path(@user)
    else # unsucessful
        redirect_to edit_user_path(@user)
    end
end

private
    def create_update_params
        params.require(:user).permit(:username, :first, :last, :email, :image)
    end

    # def update_star_chef_status
    #   if user_signed_in?
    #     @user = User.find(params[:id])

    #     @count = 0
    #         @rating = 0
    #         @chefstatus = 0
    #         allrecipes = Recipe.where("user_id == ?", @user.id)
    #         allrecipes.each do |r|
    #             @count = @count + 1
    #             if !r.rating.nil?
    #                 @rating = @rating + r.rating
    #             end
    #         end
    #     # if average stars for all recipes created by the user is greater than or equal to 4, they are a star chef
    #     if @count != 0 && @rating/@count >= 4
    #         @chefstatus = 1
    #     else
    #         @chefstatus = 0
    #     end
    # end
  end
end