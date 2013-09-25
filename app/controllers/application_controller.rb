class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  def after_sign_in_path_for(resource)	
  	if current_admin_user
  	  admin_dashboard_url 
  	else
  	  tasks_path
  	end 
  end
end
