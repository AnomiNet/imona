module UserHelper
  # User auth helpers
  # ---
  # Some overlap with ApplicationController
  def current_user
    @current_user ||= load_current_user
  end

  def load_current_user
    return nil if session[:user].blank?
    User.new( session[:user] )
  end
end
