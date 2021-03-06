class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :recipes, :through => :reviews
  has_one_attached :image
  has_and_belongs_to_many :favorite_recipes,
    class_name: "Recipe",
    foreign_key: "user_id",
    association_foreign_key: "recipe_id"
end
