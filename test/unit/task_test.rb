require 'test_helper'

class TaskTest < ActiveSupport::TestCase 
  test " should create a task " do
    task = Task.new   
    task.task_name = 'task1'
    task.description = 'this is task 1'
    task.action = 'Inbox'
    assert task.save
  end
end
