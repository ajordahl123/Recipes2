# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

recipe = Recipe.create([{recipe_name: 'sushi', meal_type: 'Dinner', vegan: 'no', vegetarian: 'no', nut_free: 'yes', dairy_free: 'yes', cuisine: 'Japanese', appliance: '', instructions: 'Put things on rice', time_to_create: 25, level: 'Easy'}])

