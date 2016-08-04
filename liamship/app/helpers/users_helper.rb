module UsersHelper
  def logged_in?
    User.exists?(session[:user_id])
  end

  def current_user
    User.find(session[:user_id])
  end
end