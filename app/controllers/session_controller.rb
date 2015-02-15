class SessionController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/secret'
    else
      @error = true
      render :new
    end
  end

  def destroy
    reset_session
    render :new
  end
end
