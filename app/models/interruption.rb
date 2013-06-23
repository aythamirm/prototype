class Interruption < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection	
  belongs_to :task
end
