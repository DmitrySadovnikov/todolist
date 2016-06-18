class SessionsController < ApplicationController
  skip_before_action :ensure_login,  only: [:new, :create]
  def new
  end

  def create
  	username = User.find_by(username: params[:user][:username])
  	password = params[:user][:password]

  	if username && username.authenticate(password)
  		session[:user_id] = username.id
  		redirect_to root_path, notice: "Logged in successfully"

  	else
  		redirect_to login_path, alert: "Invalid username/password combination"	
  end
end

  def destroy
  end
end
