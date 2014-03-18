class WelcomeController < ApplicationController
  def index
    @posts = Post.where('id > 0').order("created_at desc").limit(10)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

end
