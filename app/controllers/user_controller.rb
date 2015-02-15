class UserController < ApplicationController

  def create
    @user = User.create(users_params)
    if @user.save
      redirect_to session_path(@user) method: :post
    else
      render :index
    end  
  end

  private
    def users_params
      params.require(:users).permit(:firstName, :lastName, :username, :email, :password)
    end
end
