class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :update_sanitized_params, if: :devise_controller?
  
  def after_sign_in_path_for(resource)	
  	if current_admin_user
  	  admin_dashboard_url 
  	else
  	  tasks_path
  	end 
  end

  def update_sanitized_params
  	devise_parameter_sanitizer.for(:sign_up) {|u| u.permit( :email, :password, :password_confirmation, :first_name, :last_name)}
  end
end
