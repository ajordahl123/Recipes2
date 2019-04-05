class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :recipe
      t.integer :stars
      t.text :text
      t.references :recipe, foreign_key: true
      t.references :user, foreign_key: true
      #t.belongs_to :user

      t.timestamps
    end
  end
end
