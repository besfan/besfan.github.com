module PostsHelper
  def judge_show_edit_link_by_session(post_module)
    if (session[:user_id].present? && post_module)
      if post_module.author == User.find(session[:user_id]).name
        link_to('Edit', edit_post_path(post_module))+ "|"
      end
    end
  end

  def judge_edit_destroy_link_by_session(post_module)
    if (session[:user_id].present? && post_module)
      if post_module.author == User.find_by_id(session[:user_id]).name
        link_to('Edit', edit_post_path(post_module))+
            '|' +
            link_to('Destroy', post_module, :confirm => 'Are you sure?', :method => :delete)
      end
    end
  end

end
