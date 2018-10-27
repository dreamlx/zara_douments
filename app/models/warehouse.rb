class Warehouse < ApplicationRecord
	has_many :op_records
	validates :title, presence: true
end
