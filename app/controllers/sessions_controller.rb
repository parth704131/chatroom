class SessionsController < ApplicationController
  def new

  end
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "user logged in"
      session[:user_id] = user.id
      redirect_to users_path
    else
      flash.now[:danger] ="invalid username and password"
      render 'new'
    end

  end

  def destroy
    session[:user_id] =nil
    flash[:success] = "user logged out"
    redirect_to root_path
  end
end
