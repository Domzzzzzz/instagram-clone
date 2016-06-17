class ProfilesController < ApplicationController
# In this controller username is used for the reference instead of the usual user ID
# This is because the route is set up to display username in the url
before_action :set_user
before_action :owned_profile, only: [:edit, :update]
before_action :authenticate_user!

  def show
    @user = User.find_by(username: params[:username])
    @posts = User.find_by(username: params[:username]).posts.order('created_at DESC')
  end

  def edit
    @user = User.find_by(username: params[:username])
  end

  def update
    @user = User.find_by(username: params[:username])
    if @user.update(profile_params)
      flash[:success] = 'Your profile has been updated.'
      redirect_to profile_path(@user.username)
    else
      @user.errors.full_messages
      flash[:danger] = @user.errors.full_messages
      render :edit
    end

  end

  #--------------------------------------------------------------------------------------
  private

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end

  def set_user
    @user = User.find_by(username: params[:username])
  end

  # a user can change the URL in the address bar to navigate to another users
  # edit profile page, this method prevents that and redirects the user to root
  def owned_profile
    @user = User.find_by(username: params[:username])
    unless current_user == @user
      flash[:alert] = "That profile doesn't belong to you!"
      redirect_to root_path
    end
  end

end
