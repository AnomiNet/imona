class ApplicationController < ActionController::Base

  include ViewControllerHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # User Auth stuff
  # ---

  before_filter :set_x_forwarded_for
  before_filter :set_user_token, if: :current_user

  # Notify the API for whom this request was intended.
  # In deployment Rails is behind a reverse proxy such as HAProxy.
  # These should append the X-Forwarded-For header to requests to identify
  # users to prevent abuse.
  protected def set_x_forwarded_for
    RequestStore.store[:http_x_forwarded_for] = env['HTTP_X_FORWARDED_FOR'] || request.remote_ip
  end

  protected def set_user_token
    RequestStore.store[:user_token] = current_user.token
  end

  # Assign login cookie for a user.
  # Token is only returned after a user is created. (UsersController #create)
  def login_user(user)
    session[:user_handle] = user.handle
    cookies.permanent[:user_token] = user.token
  end

  def logout_user
    session.delete(:user_handle)
    cookies.delete(:user_token)
  end
end
