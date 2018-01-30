class Document < ActiveRecord::Base
	belongs_to :city
	belongs_to :storage
	belongs_to :staff
	has_many :op_records
	validates :code, presence: true

	before_update :reset_me
	before_create :reset_me

	def reset_me
		if self.status.blank?
			self.status = 'in_stock'
		end

		if self.title.blank?
			self.title = self.code
		end
	end
end
