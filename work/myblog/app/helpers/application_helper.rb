module ApplicationHelper
  def get_session_user_name
    User.find(session[:user_id]).name
  end
end
