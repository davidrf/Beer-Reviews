class CreateDownvotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
    end
    add_index :downvotes, [:user_id, :review_id], unique: true
  end
end
