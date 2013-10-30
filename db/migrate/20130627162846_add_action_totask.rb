class AddActionTotask < ActiveRecord::Migration
  def change
    add_column :nodes, :action, :string, default: 'Inbox'
  end
end