class AddColumnToBreweriesTable < ActiveRecord::Migration
  def change
    add_column :breweries, :year, :integer
  end
end
