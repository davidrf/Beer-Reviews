class ChangeIndex < ActiveRecord::Migration
  def up
    remove_index(:beers, name: "index_beers_on_name")
    add_index(:beers, [:name, :brewery_id], unique: true)
  end

  def down
    add_index(:beers, :name, unique: true)
    remove_index(:beers, name: "index_beers_on_name_and_brewery_id")
  end
end
