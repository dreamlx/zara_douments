class Team < ApplicationRecord
	has_many :documents
	has_many :staffs
	has_many :team_types
end
