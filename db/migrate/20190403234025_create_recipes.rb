class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :meal_type
      t.boolean :vegan
      t.boolean :vegetarian
      t.boolean :nut_free
      t.boolean :dairy_free
      t.string :cuisine
      t.text :appliance
      t.text :instructions
      t.text :ingredients
      t.integer :time_to_create
      t.string :level
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
