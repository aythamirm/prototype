class Node < ActiveRecord::Base
  # attr_accessible :title, :body
  acts_as_nested_set
  belongs_to :user
end
