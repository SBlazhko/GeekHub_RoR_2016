class AdminController < ApplicationController

  before_action :check_admin


  def set_admin_role
    User.find(params[:user_id]).update(role: true)
    redirect_to admin_users_path
  end

  def destroy_user
    User.find(params[:user_id]).destroy
    redirect_to admin_users_path
  end

  private

  def check_admin
    if User.find(current_user.id).role == false
      redirect_to user_posts_path(current_user)
  end
end
