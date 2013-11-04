class AddTimeFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :productive_time, :float
    add_column :users, :unproductive_time, :float
  end
end
