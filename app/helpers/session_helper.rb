module SessionHelper
  def log_in(user)
    session[:user_id] = user.id
    session[:user_type] = user.class.name
  end

  def log_out
    session.delete(:user_id)
    session.delete(:user_type)
  end

  def current_user
    @current_user ||= session[:user_type].constantize.find_by(id: session[:user_id]) if session[:user_id]
  end
end
