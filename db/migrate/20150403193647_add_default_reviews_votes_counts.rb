class AddDefaultReviewsVotesCounts < ActiveRecord::Migration
  def up
    change_column :reviews, :downvotes_count, :integer, default: 0
    change_column :reviews, :upvotes_count, :integer,  default: 0
  end

  def down
    change_column :reviews, :downvotes_count, :integer
    change_column :reviews, :upvotes_count, :integer
  end
end
