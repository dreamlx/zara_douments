class Team < ActiveRecord::Base
	has_many :documents
	has_many :staffs
end
