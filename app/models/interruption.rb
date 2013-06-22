class Interruption < ActiveRecord::Base
  attr_accessible :description, :end_time, :name, :start_time
  belongs_to :task
end
