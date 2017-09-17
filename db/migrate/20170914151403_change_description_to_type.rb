class ChangeDescriptionToType < ActiveRecord::Migration[5.1]
  def change
    rename_column :craft_beers, :description, :type
  end
end
