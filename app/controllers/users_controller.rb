class UsersController < ApplicationController
  def create
    # User chose a handle
    if params[:user] and params[:user][:handle].present?
      @user = User.new( params[:user] )
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

    redirect_to user_path( id: @user.handle )
  end

  def show
    # TODO: Find users
    # Just yourself for now!
    @user = current_user
  end
end
