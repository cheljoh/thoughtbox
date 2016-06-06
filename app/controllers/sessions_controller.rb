class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user.nil?
      redirect_to new_user_path
      flash[:notice] = "Please register"
    elsif @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:notice] = "Please enter valid username and password"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out!"
    redirect_to login_path
  end
end
