class UserController < ApplicationController


  def create
    binding.pry
    @user = User.create(user_params)
    if @user.save
      render :new
    else
      render :index
    end
  end

  def show
    @user = User.find(session[:user_id])
    if @user
      render :show
    else
      redirect_to login_path
    end
  end

  private
    def user_params
      params.permit(:firstName, :lastName, :username, :email, :password)
    end
end
