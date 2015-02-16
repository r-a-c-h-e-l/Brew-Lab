class UserController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to session_path
    else
      render :index
    end
  end

  def show
    @user = User.find(session[:user_id])
    if @user
      render :show
    else
      redirect_to session_path
    end
  end

  private
    def user_params
      params.permit(:firstName, :lastName, :username, :email, :password)
    end
end
