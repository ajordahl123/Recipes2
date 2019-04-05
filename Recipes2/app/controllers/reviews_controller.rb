class ReviewsController < ApplicationController
  #before_action :authenticate_user! # devise, user authentifictaion
  def show
    @recipe = Review.find(params[:id])
  end

  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)

    rescue ActiveRecord::NotNullViolation
      flash[:warning] = "New review creation failed. Please try again."
      redirect_to new_review_path

    if @article.save
      flash[:notice] = "New review created successfully."
      redirect_to recipe_path(@review.recipe) #redirect to the recipe associated with review... not sure if this is correct syntax
    else
      flash[:warning] = "New review creation failed. Please try again."
      redirect_to new_review_path
  end
  end

  private
    def review_params
      params.require(:review).permit(:text, :stars, :user, :recipe)
    end

end
