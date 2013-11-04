class AddTimeFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :total_time, :float, default: 0.0
    add_column :users, :unproductive_time, :float, default: 0.0
  end
end
