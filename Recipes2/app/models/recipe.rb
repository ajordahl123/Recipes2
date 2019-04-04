class Recipe < ApplicationRecord
    has_one_attached :image
    has_many :reviews
    has_many :users, :through => :reviews
end
