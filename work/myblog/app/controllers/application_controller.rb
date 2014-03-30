class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_user_permission
    if session[:user_id].nil?
      message = "Please login first!"
      redirect_to "/admin/index", :notice=>message
    elsif  User.find_by_id(session[:user_id]).nil?
      message = "User is not existing, Please login first!"
      redirect_to "/admin/index", :notice=>message
    else
      return true
    end
  end

  def head_photo_check
    params[:user][:head_photo] = params[:user][:head_photo].nil? ?
        "1ddf772f4b3800b2627d6a7caa4d89bc.jpg" : params[:user][:head_photo]
  end


end
