class AddDurationToInterruption < ActiveRecord::Migration
  def change
    add_column :nodes, :duration, :float
  end
end
