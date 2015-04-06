class AddCacheColumns < ActiveRecord::Migration
  def change
    add_column :reviews, :upvotes_count, :integer
    add_column :reviews, :downvotes_count, :integer
  end
end
