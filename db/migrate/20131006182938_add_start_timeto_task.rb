class AddStartTimetoTask < ActiveRecord::Migration
  def change
    add_column :nodes, :start_time, :date
  end
end
