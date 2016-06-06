class UsersController < ApplicationController
  before_action :require_user, only: [:edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:notice] = "Please enter a valid username and password"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name)
  end
end
