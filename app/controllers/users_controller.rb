class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def new
  end

  def create
    current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  def sign_out
    redirect_to root_path
  end
end
