class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :meal_type
      t.string :restriction
      t.string :cuisine
      t.text :appliance
      t.text :instructions
      t.text :ingredients
      t.time :timetocreate
      t.string :level

      t.timestamps
    end
  end
end
