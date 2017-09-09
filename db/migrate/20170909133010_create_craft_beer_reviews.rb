class CreateCraftBeerReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :craft_beer_reviews do |t|
      t.integer :rating, null: false
      t.text :description, null: false
      t.belongs_to :user
      t.belongs_to :craft_beer

      t.timestamps
    end
  end
end
