class AddReferencesToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :user_id, :reference
  end
end
