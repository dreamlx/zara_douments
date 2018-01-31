class Team < ActiveRecord::Base
	has_many :op_records
	has_many :staffs
end
