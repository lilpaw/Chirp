helpers do

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_logged_in!
    return if current_user
    redirect '/sessions/new'
  end

end
