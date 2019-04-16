class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  def recipe_title
    if self.recipe.nil?
      return "not available"
    else return self.recipe.title
    end
  end

end
