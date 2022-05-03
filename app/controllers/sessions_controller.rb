class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      helpers.remember @user
      redirect_to '/login', notice: "Logged in"
    else
      redirect_to '/login', notice: "Not logged in"
    end
  end

  def destroy
    session.delete(:user_id)
    @user = nil;
    redirect_to '/login', notice: "Logged out"
  end

end