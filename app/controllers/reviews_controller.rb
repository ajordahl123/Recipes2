class ReviewsController < ApplicationController
  
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    @recipe.reviews << @review

    if @review.save!
      flash[:notice] = "New review created successfully."
      redirect_to recipe_path(@recipe) and return #redirect to the recipe associated with review
    else
        # handled by pop-up notice. Cannot sumbit if any required field is not completed or contains incorrect input
    end
  end

  private
    def review_params
      params.require(:review).permit(:text, :stars, :user_id, :recipe_id)
    end

end
