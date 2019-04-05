class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    byebug
    @recipe = Recipe.find(params[:recipe_id]) #can't find :recipe_id (can't find params???)
    @review = Review.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    @recipe.reviews << @review
    current_user.reviews << @review

    # rescue ActiveRecord::NotNullViolation
    #   flash[:warning] = "New review creation failed. Please try again."
    #   redirect_to new_review_path and return

    if @review.save
      flash[:notice] = "New review created successfully."
      redirect_to recipe_path(@recipe) and return #redirect to the recipe associated with review... not sure if this is correct syntax
    else
      byebug
      flash[:warning] = "New review creation failed. Please try again."
      redirect_to new_review_path and return
    end
  end

  private
    def review_params
      params.require(:review).permit(:text, :stars, :user, :recipe)
    end

end
