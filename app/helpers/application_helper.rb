module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif 
      user = User.find_by(id: user_id) 
      if user && user.authenticated?(cookies[:remember_token])
        log_in user 
        @current_user = user 
      end
    end
  end

  def following?(user_id)
    current_user_relations = Relationship.where(follower_id: current_user.id)
    if current_user_relations.empty? 
      return false 
    else
      user_follows = current_user_relations.where(followed_id: user_id)
      if user_follows.empty? 
        return false
      else
        return true
      end 
    end
  end

  def forget(user)
    user.forget 
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out 
    forget(current_user)
    session.delete(:user_id)
  end

  def remember(user)
    user.remember 
    cookies.permanent.encrypted[:user_id] = user.id 
    cookies.permanent[:remember_token] = user.remember_token
  end

end
