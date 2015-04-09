class RemoveValidationsFromBreweryTable < ActiveRecord::Migration
  def up
    drop_table :breweries
  end

  def down
    create_table :breweries do |t|
      t.string :name, null: false
      t.string :city
      t.string :state
      t.string :country
      t.string :description
    end
  end
end
