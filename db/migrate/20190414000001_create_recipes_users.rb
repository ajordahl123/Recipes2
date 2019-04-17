class CreateRecipesUsers < ActiveRecord::Migration[5.2]
    def change
      create_table :recipes_users, id: false do |t|
        t.belongs_to :recipe, index: true
        t.belongs_to :user, index: true
      end
    end
end