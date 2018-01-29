class Staff < ActiveRecord::Base
	has_many :documents
	has_many :borrow_records
	validates :code, presence: true
end
