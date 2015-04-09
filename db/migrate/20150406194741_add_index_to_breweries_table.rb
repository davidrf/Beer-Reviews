class AddIndexToBreweriesTable < ActiveRecord::Migration
  def change
    add_index :breweries, :name, unique: true
    add_index :breweries, :country
  end
end
