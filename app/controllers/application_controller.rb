class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= load_current_user
  end

  def load_current_user
    return nil if session[:user].blank?
    User.new( session[:user] )
  end

  # Assign login cookie for a user.
  # Token is only returned after a user is created. (UsersController #create)
  def login_user(user)
    session[:user] = {
      handle: user.handle,
      token: user.token
    }
  end

  def logout_user
    session[:user] = nil
  end
end
