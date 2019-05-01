# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# users
user_list = [["cnie@gmail.com","cn0017","Can","Nie","1234567"],
    ["bobama@gmail.com","bo616","Barack","Obama","1234567"],
    ["asmish@gmail.com","as505",'Adam',"Smith","1234567"]
]

user_list.each do |email, username, first, last, password|
    User.create(email: email, username: username, first: first, last: last, password: password)
end


#recipes
recipe_list = [['sushi','Dinner','no','no','yes','yes','Japanese','','Put things on rice','rice, fish, soy sauce, wasabi','10','Easy',2],
	    ['spaghetti','Dinner','yes','yes','yes','yes','Italian','pot','Boil spaghetti','spaghetti','20','Medium',3],
	    ['burger','Lunch','no','no','yes','no','American','pan','This is a test','buns,grounded beef,cheese,tomato,lettuce','30','Hard',1]
	    #,'app/assets/images/sushi.jpg','app/assets/images/spaghetti.jpg'
]


recipe_list.each do |name, type, is_vegan, is_vege, is_nutf, is_dairyf, cuisine,
    appliance, instr, ingre, time, level, user_id|#img_path
    #img = File.read(img_path)
    Recipe.create( recipe_name: name, meal_type: type, vegan:is_vegan, vegetarian: is_vege, nut_free: is_nutf,
        dairy_free: is_dairyf, cuisine: cuisine, appliance: appliance, instructions: instr, ingredients: ingre,
        time_to_create: time, level: level, user_id: user_id)#, image: Rails.root.join(img_path).open
end

#reviews
    # revtext = {
    #     1 => "disgusting",
    #     2 => "not great",
    #     3 => "meh",
    #     4 => "pretty good",
    #     5 => "delicious",
    # }
review_list = [[1,'It was disgusting',1,1],
    [3,'meh',2,2],
    [5,'It was delicious!',3,3]
]
review_list.each do |star, text, recipe_id, user_id|
    Review.create(stars: star, text: text, recipe_id: recipe_id, user_id: user_id)
end