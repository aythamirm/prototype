class Project < Node
  include ActiveModel::ForbiddenAttributesProtection
  validates :project_title, presence: true
end
