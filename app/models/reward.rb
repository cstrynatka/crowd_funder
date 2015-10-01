class Reward < ActiveRecord::Base
	belongs_to :pledge
	belongs_to :project
end
