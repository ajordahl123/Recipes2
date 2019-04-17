class Review < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  belongs_to :recipe

  def recipe_title
    if self.recipe.nil?
      return "not available"
    else return self.recipe.title
    end
  end



end
