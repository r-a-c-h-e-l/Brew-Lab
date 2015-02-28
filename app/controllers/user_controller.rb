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
    session_token = session[:token]
    if @user
      respond_to do |format|
        format.html { render :show }
        format.json { render json: session_token}
      end
    else
      redirect_to session_path
    end
  end

  private
    def user_params
      params.permit(:firstName, :lastName, :username, :email, :password)
    end
end
