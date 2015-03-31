class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name, null: false
      t.integer :abv
      t.integer :ibu
      t.text :description
      t.integer :style_id, null: false
      t.integer :user_id, null: false
    end
  end
end
