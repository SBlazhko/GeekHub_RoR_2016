class UsersController < ApplicationController
  
  before_action :require_user, only: [:show]
  before_action :set_user, only: [:show]
  
  def show
  end

  def new 
    @user = User.new    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to :back
  end

  def set_admin
    User.find(params[:id]).update(admin: true)
    redirect_to :back
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :surname, :age, :avatar)
  end 
  
  def set_user
    @user = User.find(current_user.id)
  end  
end
