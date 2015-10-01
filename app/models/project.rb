class Project < ActiveRecord::Base
	belongs_to :user
	has_many :pledges
	has_many :rewards
	has_many :users, through: :pledges
end
