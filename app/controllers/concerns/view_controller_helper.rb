# Contains shared helpers for views and controllers.
module ViewControllerHelper

  # User
  # ---
  def current_user
    @current_user ||= load_current_user
  end

  def load_current_user
    return nil if ( cookies[:user_handle].blank? or cookies[:user_token].blank? )
    user = {
      handle: cookies[:user_handle],
      token: cookies[:user_token],
    }
    User.new(user)
  end

end
