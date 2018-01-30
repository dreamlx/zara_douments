class Staff < ActiveRecord::Base
	has_many :documents
	has_many :op_records
	validates :code, presence: true
end
