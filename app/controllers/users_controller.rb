class UsersController < ApplicationController
  def create
    # User chose a handle
    if params[:user]
      @user = User.new(user_params)
    else
      @user = User.new

      # It's possible the generated name isn't unique.
      # In this case @user.save below will fail and the user will need to press
      # the Create User button again.
      @user.handle = RandomName.generate
    end

    if @user.save
      login_user(@user)
      flash[:notice] = "Created user: #{ @user.handle }"
    else
      flash[:alert] = "Couldn't create user."
    end

    redirect_to :back
  end

  private def user_params
    params.require(:user).permit(:handle)
  end
end
