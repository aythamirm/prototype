class AddDurationToInterruption < ActiveRecord::Migration
  def change
  	add_column :interruptions, :duration, :float
  end
end
