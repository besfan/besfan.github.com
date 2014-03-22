module ApplicationHelper
  def get_session_user_name
    User.find(session[:user_id]).name
  end

  def user_name_tag(user_name)
    html_tag = '<span class="comment_author">' +
        link_to(user_name, "/users/user_home/#{user_name}") +
        '</span>'
    sanitize html_tag
  end
end
