class AddEstimatedTimeToTask < ActiveRecord::Migration
  def change
  	add_column :nodes, :estimated_time, :float
  end
end
