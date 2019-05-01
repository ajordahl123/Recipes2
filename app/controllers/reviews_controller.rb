class ReviewsController < ApplicationController
  
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    @recipe.reviews << @review

    if @review.save
      flash[:notice] = "New review created successfully."
      redirect_to recipe_path(@recipe) and return #redirect to the recipe associated with review
    else
        # with validation in model
        #render 'new'
        redirect_to new_recipe_review_path(@recipe)
    end
  end

  private
    def review_params
      params.require(:review).permit(:text, :stars, :user_id, :recipe_id)
    end

end
