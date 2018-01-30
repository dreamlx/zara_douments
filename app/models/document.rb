class Document < ActiveRecord::Base
	belongs_to :city
	belongs_to :storage
	belongs_to :staff
	has_many :op_records
	validates :code, presence: true

end
