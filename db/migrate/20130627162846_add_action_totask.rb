class AddActionTotask < ActiveRecord::Migration
  def change
    add_column :nodes, :action, :string
  end
end