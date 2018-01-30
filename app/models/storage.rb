class Storage < ActiveRecord::Base
	validates :code, presence: true
	has_many :documents

	before_update :reset_me
	before_create :reset_me

	def reset_me
		if self.status.blank?
			self.status = 'active'
		end

		if self.title.blank?
			self.title = self.code
		end
	end
end
