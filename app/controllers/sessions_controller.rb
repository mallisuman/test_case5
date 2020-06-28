class SessionsController < ApplicationController

  def new
  end  

  def create
    user = User.where(username: params[:username]).last
    if user && user.password_digest == Digest::MD5.hexdigest(Digest::MD5.hexdigest(params[:password]))
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end  

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end