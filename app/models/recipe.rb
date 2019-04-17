class Recipe < ApplicationRecord
    has_one_attached :image
    has_many :reviews
    belongs_to :user, required: false
    
    scope :recipe_name, -> (name) { where(recipe_name: name)}  
    scope :cuisine, -> (cuisine) { where(cuisine: cuisine)}
    scope :level, -> (level) { where(level: level)}
    scope :meal_type, -> (type) { where(meal_type: type)}
    scope :time_to_create, -> (time) { where("time_to_create <= ?", "#{time}")}
    scope :vegan, -> (value) { where(vegan: value)}
    scope :vegetarian, -> (value) { where(vegetarian: value)}
    scope :dairy_free, -> (value) { where(dairy_free: value)}
    scope :nut_free, -> (value) { where(nut_free: value)}
    
    has_and_belongs_to_many :fans,
        class_name: "User",
        foreign_key: "recipe_id",
        association_foreign_key: "user_id"
end