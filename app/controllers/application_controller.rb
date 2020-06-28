class ApplicationController < ActionController::Base
  helper_method :current_user  

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def login_required
	unless current_user
	  redirect_to root_url, notice: "Please login before accessing products!"		
	end
  end
end
