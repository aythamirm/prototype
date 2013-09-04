class Users::SessionsController < Devise::SessionsController
  layout 'home' unless %w(edit update).include? action_name
end