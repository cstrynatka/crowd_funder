class User < ActiveRecord::Base

	# attr_accessible :first_name :last_name, :email, :password, :password_confirmation
	attr_accessor :password, :password_confirmation

	has_many :pledges
	has_many :projects
	
end
