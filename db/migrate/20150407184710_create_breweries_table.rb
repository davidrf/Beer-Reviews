class CreateBreweriesTable < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name, null: false
      t.string :city
      t.string :state
      t.string :country
      t.string :description

      t.index :name, unique: true
    end
  end
end
