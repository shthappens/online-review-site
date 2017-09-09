class CreateCraftBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :craft_beers do |t|
      t.string :name, null: false
      t.string :brewery, null: false
      t.string :description, null: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
