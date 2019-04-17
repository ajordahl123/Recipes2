# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.delete_all


ulist = []
ulist << User.create(first: "Barack", last: "Obama")
ulist << User.create(first: "Michelle", last: "Obama")

rlist = []

rlist << Recipe.create!([{recipe_name: 'sushi', meal_type: 'Dinner', vegan: 'no', vegetarian: 'no', nut_free: 'yes', dairy_free: 'yes', cuisine: 'Japanese', appliance: '', instructions: 'Put things on rice', time_to_create: 25, level: 'Easy', user: ulist[0]}])
rlist << Recipe.create!([{recipe_name: 'spaghetti', meal_type: 'Dinner', vegan: 'yes', vegetarian: 'yes', nut_free: 'yes', dairy_free: 'yes', cuisine: 'Italian', appliance: '', instructions: 'Boil spaghetti', time_to_create: 7, level: 'Easy', user: ulist[1]}])

# 1.upto(2) do |id|
#     puts "Adding reviews to recipe #{id}"
#
#     revtext = {
#         1 => "disgusting",
#         2 => "not great",
#         3 => "meh",
#         4 => "pretty good",
#         5 => "delicious",
#     }
#
#     num_reviews =rand(3)+2
#     num_reviews.times do
#         rtype = rand(5)+1
#         rtext = revtext[rtype]
#         r = Review.create(stars: rtype, review: "It was #{rtext}.")
#         r.user = ulist[rand(2)]
#         r.recipe = rlist[id]
#         r.save
#     end
# end
