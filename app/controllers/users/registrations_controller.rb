class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  skip_before_filter :verify_authenticity_token, :only => [:create, :new, :edit, :update]
  skip_before_action :require_no_authentication, :only => [:new, :create, :edit, :destroy]

  def new
      super
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :mobile_number, :email, :password, :password_confirmation, :org_name, :app_name, :icon, :app_landing_image, :theme)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :mobile_number, :email, :password, :password_confirmation, :org_name, :app_name, :icon, :app_landing_image, :theme)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :mobile_number, :email, :password, :password_confirmation, :current_password, :org_name, :app_name, :icon, :app_landing_image, :theme)
    end
  end

end
