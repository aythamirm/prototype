class AddFinishTimeToNode < ActiveRecord::Migration
  def change
  	add_column :nodes, :finish_time, :datetime
  end
end
