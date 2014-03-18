class CommentsController < ApplicationController
  def new
  end

  def create
    post = Post.find(params[:post_id])
    commenter = {:commenter  => User.find(session[:user_id]).name}
    params[:comment].merge! commenter
    post.comments.create(params[:comment])
    redirect_to post_path(post)
  end

end
