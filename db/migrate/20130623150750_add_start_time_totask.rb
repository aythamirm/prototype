class AddStartTimeTotask < ActiveRecord::Migration
  def change
    add_column :nodes, :start_time, :datetime
  end
end