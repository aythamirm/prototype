class Users::RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :unproductive_time, :total_time)
  end
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar, :unproductive_time, :total_time)
  end
  private :sign_up_params
  private :account_update_params
end