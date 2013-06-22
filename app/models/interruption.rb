class Interruption < ActiveRecord::Base
  attr_accessible :description, :end_time, :name, :start_time, :task_id
  belongs_to :task
end
