class RemoveStartTimetoTask2 < ActiveRecord::Migration
  def change
  remove_column :nodes, :start_time
  end

end
