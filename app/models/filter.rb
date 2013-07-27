class Filter 
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :state, :search
 
  def initialize (attributes = {})
    attributes.each { |key, value |  send "#{key}=", value }
  end

  def persisted?
    false
  end
end	


