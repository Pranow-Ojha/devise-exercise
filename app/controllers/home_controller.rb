class HomeController < ApplicationController
  def index
    @user = User.find(current_user)
    if @user.role == "admin"
      redirect_to home_admin_landing_page_path
    elsif @user.role == "end_user"
      redirect_to home_end_user_landing_page_path
    else

    end
  end


  def admin_landing_page
    @user = User.find(current_user)

  end


  def end_user_landing_page
    @user = User.find(current_user)

  end

  def new_user_register
    @user = User.new
  end

  def save_user
    @user = User.new(end_user_params)
    if (@user.mobile_number.blank? && @user.app_landing_image.blank?  && @user.icon.blank? && @user.org_name.blank? && @user.app_name.blank?)
    @user.save(validate:false)
    else
    @user.save
    end
    redirect_to home_list_of_users_path
  end


  def list_of_users
    @users = User.all
  end

  def list_of_end_users
    @users = User.where(role: "end_user")
  end

  def remove_user
    @user = User.find(params[:user_id])
    @user.destroy
    redirect_to :back
  end
end



private

def end_user_params
  params.require(:user).permit(:name, :mobile_number, :email, :password, :password_confirmation, :org_name, :app_name, :icon, :app_landing_image, :theme, :role, :pin_code, :date_of_birth, :address)
end
