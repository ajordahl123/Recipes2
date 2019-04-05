class Review < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :recipe, required: false

  def recipe_title
    if self.recipe.nil?
      return "not available"
    else return self.recipe.title
    end
  end

end
