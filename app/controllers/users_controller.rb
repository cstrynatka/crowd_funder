class UsersController < ApplicationController

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to user_path
		end
	end

  def index
  	@users = User.all
  end


  def new
  	@user = User.new
  	# session[:return_to] = request.referrer
  end


  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "User created!"
  		redirect_to root_path
  	else
  		flash.now[:alert] = "Sorry, bruh. Try again."
  		render 'new'
  	end
  		# redirect_to projects_url, notice: "Signed up"
  	# 	session[:user_id] = @user.user_id
  	# 	redirect_to session[:return:to], :notice => "Registration successful!"
  	# 	session[:return_to] = nil
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
