class Node < ActiveRecord::Base
  include TheSortableTree::Scopes
  acts_as_nested_set
  belongs_to :user

  def title
  	if self.type == 'Project'	
  	  project_title
    else
      task_name
    end
  end	
end
