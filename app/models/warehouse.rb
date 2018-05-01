class Warehouse < ActiveRecord::Base
	has_many :op_records
	validates :title, presence: true
end
