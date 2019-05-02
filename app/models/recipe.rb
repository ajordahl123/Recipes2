class Recipe < ApplicationRecord
    has_one_attached :image, :dependent => :destroy
    has_many :reviews, :dependent => :destroy
    belongs_to :user, required: false
    validates :recipe_name, :cuisine, :ingredients, :instructions, presence: true
    validates :meal_type, inclusion: {in: %w(Breakfast Lunch Dinner Dessert)}
    validates :time_to_create, numericality: { only_integer: true }
    validates :level, inclusion: {in: %w(Easy Medium Hard)}
    validates_associated :user
    validates_associated :reviews
    #scopes for filtering
    scope :recipe_name_filter, -> (name) { where('UPPER(recipe_name) LIKE ?', "%#{name}%")}
    scope :cuisine_filter, -> (cuisine) { where(cuisine: cuisine)}
    scope :level_filter, -> (level) { where(level: level)}
    scope :meal_type_filter, -> (type) { where(meal_type: type)}
    scope :time_to_create_filter, -> (time) { where("time_to_create <= ?", "#{time}")}
    scope :appliance_filter, -> (app) { where('UPPER(appliance) LIKE ?', "#{app}")}
    scope :vegan_filter, -> (value) { where(vegan: 1)}
    scope :vegetarian_filter, -> (value) { where(vegetarian: value)}
    scope :dairy_free_filter, -> (value) { where(dairy_free: value)}
    scope :nut_free_filter, -> (value) { where(nut_free: value)}

    has_and_belongs_to_many :fans,
        class_name: "User",
        foreign_key: "recipe_id",
        association_foreign_key: "user_id"

  def rating
    sum = 0
    num = 0
    self.reviews.each do |r|
      sum += r.stars
      num += 1
    end
    if num > 0
      avg = (sum.to_f/num.to_f).round(1)
    else
      -1
    end
  end

  def num_reviews
    self.reviews.length
  end

  def Recipe.sort_by_num_reviews
    recipes = Recipe.all
    hash = {}
    recipes.each do |r|
      num = r.reviews.length
      hash[r] = num
    end
    list = hash.sort_by{|name, num| num}
    rlist = []
    list.each do |l|
      rlist << l[0]
    end
    rlist
  end

  def Recipe.sort_by_rating
    recipes = Recipe.all
    hash = {}
    recipes.each do |r|
      avg = r.rating
      hash[r] = avg
    end
    list = hash.sort_by{|name, avg| avg}
    rlist = []
    list.each do |l|
      rlist << l[0]
    end
    rlist
  end

  def Recipe.sort_by_difficulty
    recipes = Recipe.all.order("created_at DESC")
    easy = []
    med = []
    hard = []

    recipes.each do |r|
      if r.level == "Easy"; easy << r;
      elsif r.level == "Medium"; med << r;
      else r.level; hard << r; end;
    end

    rec = easy + med + hard
  end



end
