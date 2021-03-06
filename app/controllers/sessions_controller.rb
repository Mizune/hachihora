class SessionsController < ApplicationController
	skip_before_action :check_logined, only:[:new, :create]
 def new
  end

  def create
  	user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
    	session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  def show

  end

end
