class RemoveBeerFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :beer, :string
  end
end
