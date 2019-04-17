class Recipe < ApplicationRecord
    has_one_attached :image, :dependent => :destroy
    has_many :reviews, :dependent => :destroy
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

    # scope :sort_by_most_reviewed, -> () {joins(:reviews).select("recipes.id, count(reviews) as num_reviews").group("recipes.id").order("num_reviews DESC")}

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
