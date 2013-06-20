class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :type

      t.string :project_title

      t.string :task_name
      t.date :due_date
      t.integer :priority
      t.text :note

      t.timestamps
    end
  end
end
