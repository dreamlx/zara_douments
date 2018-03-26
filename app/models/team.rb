class Team < ActiveRecord::Base
	has_many :documents
	has_many :staffs
	has_many :team_types
end
