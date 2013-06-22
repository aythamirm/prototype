class CreateInterruptions < ActiveRecord::Migration
  def change
    create_table :interruptions do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :name
      t.text :description
      t. references :task
      t.timestamps
    end
    add_index :interruptions, :task_id
  end
end
