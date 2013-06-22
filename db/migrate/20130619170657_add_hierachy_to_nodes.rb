class AddHierachyToNodes < ActiveRecord::Migration
  def change
  	add_column :nodes, :rgt, :integer 
  	add_column :nodes, :lft, :integer
  	add_column :nodes, :parent_id, :integer
  end
end
