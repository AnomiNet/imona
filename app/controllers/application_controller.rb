class ApplicationController < ActionController::Base

  include ViewControllerHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # User Auth stuff
  # ---

  before_filter :set_user_token, if: :current_user

  protected def set_user_token
    RequestStore.store[:user_token] = current_user.token
  end

  # Assign login cookie for a user.
  # Token is only returned after a user is created. (UsersController #create)
  def login_user(user)
    cookies.permanent[:user_handle] = user.handle
    cookies.permanent[:user_token] = user.token
  end

  def logout_user
    cookies.delete(:user_handle)
    cookies.delete(:user_token)
  end
end
