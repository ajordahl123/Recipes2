class Recipe < ApplicationRecord
    has_one_attached :image
    has_many :reviews
    belongs_to :user, required: false

    scope :recipe_name_filter, -> (name) { where('recipe_name LIKE ?', "%#{name}%")}
    scope :cuisine_filter, -> (cuisine) { where(cuisine: cuisine)}
    scope :level_filter, -> (level) { where(level: level)}
    scope :meal_type_filter, -> (type) { where(meal_type: type)}
    scope :time_to_create_filter, -> (time) { where("time_to_create <= ?", "#{time}")}
    scope :appliance_filter, -> (app) { where('appliance LIKE ?', "#{app}")}
    scope :vegan_filter, -> (value) { where(vegan: value)}
    scope :vegetarian_filter, -> (value) { where(vegetarian: value)}
    scope :dairy_free_filter, -> (value) { where(dairy_free: value)}
    scope :nut_free_filter, -> (value) { where(nut_free: value)}
    
    has_and_belongs_to_many :fans,
        class_name: "User",
        foreign_key: "recipe_id",
        association_foreign_key: "user_id"
end