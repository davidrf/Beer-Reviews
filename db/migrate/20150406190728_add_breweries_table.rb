class AddBreweriesTable < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :state
      t.string :country, null: false
      t.text :description
    end
  end
end
