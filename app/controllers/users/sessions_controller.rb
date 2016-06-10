class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  def create
    user = User.find_by_email(params[:user][:email])
    if !user.blank?
      if user.valid_password?(params[:user][:password])
        super
      else
        flash[:password_error]= "Invalid Password"
        redirect_to :action => "new"
      end
    elsif user.blank?
      if params[:user][:email] == ""
        flash[:email_error] = "Please enter valid email address"
        redirect_to :action => "new"
      else
        flash[:email_error] = "Invalid Email Address"
        redirect_to :action => "new"
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
