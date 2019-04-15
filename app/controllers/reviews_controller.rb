class ReviewsController < ApplicationController
  # TO DO: IMPLEMENTATION WILL BE CONTINUED IN NEXT ITERATION

  def index
    @recipe = Recipe.find(params[:recipe_id])
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.find(params[:id])
    redirect_to recipe_path(@recipe) and return
  end

  def new
    # byebug
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    byebug
    @review = Review.new(review_params)
    @recipe.reviews << @review

    byebug
    # current_user.reviews << @review

    # rescue ActiveRecord::NotNullViolation
    #   flash[:warning] = "New review creation failed. Please try again."
    #   redirect_to new_review_path and return

    if @review.save
      flash[:notice] = "New review created successfully."
      redirect_to recipe_path(@recipe) and return #redirect to the recipe associated with review
    else
      flash[:warning] = "New review creation failed. Please try again."
      redirect_to new_recipe_review_path and return
    end
  end

  private
    def review_params
      params[:user] = current_user
      params.require(:review).permit(:text, :stars, :recipe_id, :user_id)
    end

end
