class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def new
  end

  def create
    current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  def sign_out
    redirect_to root_path
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :phone_number, :location)
  end
end
