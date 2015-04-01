class AddIndexesAndConstraints < ActiveRecord::Migration
  def up
    change_column :beers, :abv, :float
    change_column :beers, :description, :text, :limit => 5000
    change_column :reviews, :description, :text, :limit => 1000
    add_index :beers, :name, unique: true
    add_index :beers, :style_id
    add_index :styles, :name, unique: true
    add_index :reviews, :user_id
    add_index :reviews, :beer_id
  end

  def down
    change_column :beers, :abv, :integer
    change_column :beers, :description, :text
    change_column :reviews, :description, :text
    remove_index :beers, :name
    remove_index :beers, :style_id
    remove_index :styles, :name
    remove_index :reviews, :user_id
    remove_index :reviews, :beer_id
  end
end
