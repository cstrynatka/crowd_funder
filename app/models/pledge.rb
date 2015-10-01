class Pledge < ActiveRecord::Base
	belongs_to :project
	belongs_to :reward
	belongs_to :user
end
