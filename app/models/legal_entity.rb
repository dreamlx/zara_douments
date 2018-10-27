class LegalEntity < ApplicationRecord
	has_many :documents

	before_create :reset_me


	def reset_me

		if self.title.blank?
			self.title = self.abbr
		end
	end
end
