class UsersController < ApplicationController


  def index
  	@users = User.all
  end


  def new
  	@user = User.new
  	session[:return_to] = request.referrer
  end


  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.user_id
  		redirect_to session[:return:to], :notice => "Registration successful!"
  		session[:return_to] = nil
  	else
  		render :new
  	end
  end


  def show
  	@user = User.find(params[:id])
  end


  def destroy
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :last_logged_in)
  	end
end
