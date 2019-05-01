class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :recipe


  validates :stars, inclusion: {in: 1..5}
  validates :text, presence: true
  validates :recipe_id, numericality: { only_integer: true }
  validates :user_id, numericality: { only_integer: true }
end
