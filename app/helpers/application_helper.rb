module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @user = User.get_by(id: session[:user_id])
  end

  def log_out 
    session.delete(:user_id)
  end

end
