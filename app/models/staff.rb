class Staff < ActiveRecord::Base
	has_many :documents
	has_many :op_records
	validates :code, presence: true

	before_update :reset_me
	before_create :reset_me

	def reset_me
		if self.title.blank?
			self.title = self.code
		end
	end
end
