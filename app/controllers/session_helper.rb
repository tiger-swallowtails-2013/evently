helpers do

  def login
    @user = User.where('email=?',@email).find_by password: @password
    start_session if @user
  end

  def start_session
    session[:user_id] = @user.id
  end

  def logged_in?
    current_user
  end

  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logout
    session[:user_id] = nil
  end

end