class SessionController < ApplicationController
  def new
      render :new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      # redirect to user GET /users
      redirect_to user_path(@user)
    else
      @error = true
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
