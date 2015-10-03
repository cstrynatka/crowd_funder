class Project < ActiveRecord::Base

	cattr_accessor :current_user
	
	belongs_to :user
	has_many :pledges
	has_many :rewards
	has_many :users, through: :pledges
end
