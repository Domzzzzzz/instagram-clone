class RegistrationsController < Devise::RegistrationsController

# Devise Strong params for accepting newly added params for users 
# default params = :email, :password, :password_confirmation, current_password
  private

  def sign_up_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :current_password)
  end

end
