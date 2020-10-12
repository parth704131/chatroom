class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
      begin
        @current_user = User.find(session[:user_id])
      rescue
        session[:user_id]=nil
      end
    end
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must login for perfom action"
      redirect_to login_path
    end
  end
end
