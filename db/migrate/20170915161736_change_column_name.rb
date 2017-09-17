class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :craft_beers, :type, :craft_beer_type
  end
end
