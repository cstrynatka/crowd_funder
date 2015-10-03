class User < ActiveRecord::Base

	has_secure_password

	# attr_accessible :first_name :last_name, :email, :password, :password_confirmation
	attr_accessor :password, :password_confirmation

	has_many :pledges
	has_many :projects

end
