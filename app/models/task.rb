class Task < Node
  include ActiveModel::ForbiddenAttributesProtection
  has_many :interruptions

  state_machine :state, :initial => :to_do do
    
    event :activate do
      transition [:to_do, :paused, :expired] => :active
    end
    
    event :finish do
      transition [:active] => :finished
    end

    event :pause do
      transition [:active] => :paused
    end

    event :expire do
      transition [:active] => :expired
    end

  end
end
