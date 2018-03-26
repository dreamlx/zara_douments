class TeamType < ActiveRecord::Base
	belongs_to :team
	has_many :documents
end
