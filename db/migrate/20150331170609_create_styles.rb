class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name, null: false
    end
  end
end
