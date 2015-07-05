class SessionsController < ApplicationController
  def destroy
    logout_user
    flash[:notice] = "Logged out."
    redirect_to root_path
  end
end
