require 'test_helper'

class TaskTest < ActiveSupport::TestCase 
  test " should create a task " do
    task = Task.new   
    task.task_name = 'task1'
    task.note = 'this is task 1'
    task.action = 'Inbox'
    assert task.save
  end

  test "should delete a task" do
    task = Task.new
    task.task_name = 'task1'
    task.note = 'this is task 1'
    task.action = 'Inbox'
    assert task.save
    task_id = Node.find(task.id)
    assert task_id.destroy  
  end  
end
