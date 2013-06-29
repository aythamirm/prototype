class AddReferencesToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :user_id, :integer
    add_index :nodes, :user_id
  end
end
