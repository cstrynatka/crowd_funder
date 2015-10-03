class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.where(email: params[:email]).first
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.user_id
  		redirect_to projects_url, notice: "Logged in, bruh"
  	else
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to projects_url, notice: "Logged out, bruh"
  end
end
