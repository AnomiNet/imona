class SessionsController < ApplicationController
  def destroy
    logout_user
    @current_user = nil
    RequestStore.store[:user_token] = nil
  end
end
