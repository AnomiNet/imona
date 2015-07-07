# Contains shared helpers for views and controllers.
module ViewControllerHelper

  # User
  # ---
  def current_user
    @current_user ||= load_current_user
  end

  def load_current_user
    return nil if session[:user].blank?
    User.new( session[:user] )
  end

end
