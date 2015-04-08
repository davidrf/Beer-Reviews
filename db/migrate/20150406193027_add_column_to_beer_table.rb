class AddColumnToBeerTable < ActiveRecord::Migration
  def change
    add_column :beers, :brewery_id, :integer
    add_index :beers, :brewery_id
  end
end
