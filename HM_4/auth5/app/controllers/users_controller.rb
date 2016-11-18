class UsersController < ApplicationController
   before_action :set_params, only: [:show]

  def show 
  end

  def new 
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_params

    if session[:user_id] != nil && current_user.id == session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to sign_in_path
    end
  end
end
