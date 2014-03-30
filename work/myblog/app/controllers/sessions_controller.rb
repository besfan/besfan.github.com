class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:name], params[:password])
    if user
      session[:user_id] = user.id
      I18n.t
      redirect_to root_url
    else
      redirect_to "/admin/index", :alert => "User Name or Password error!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/admin/index", :alert => "Logout successfully!"
  end

end
