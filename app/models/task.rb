class Task < Node
  include ActiveModel::ForbiddenAttributesProtection
  has_many :interruptions
end
