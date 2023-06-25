class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    
  def logged_in?
    !!current_user
  end
    
  def require_user 
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end

  def authenticated_user
    if current_user.user_type == "kitchen_user"
      flash[:alert] = "User must be an administrator"
      redirect_to login_path
    end
  end
end
