class BorrowRecord < ActiveRecord::Base

	#validates :staff_sn, presence: true
	validates :document_sn, presence: true

	# validate :exit_document
	# def exit_document
	# 	docment = Document.find_by(code: self.document_sn)
	# 	if document.blank? or document.nil?
	# 		self.errors.add(:document_sn, self.document_sn + ' document_sn not exist!')
	# 	end
	# end

	belongs_to :staff
	belongs_to :document

	before_update :reset_me
	before_create :reset_me

	def reset_me
		if Staff.find_by(code: self.staff_sn) != nil
			self.staff_id = Staff.find_by(code: self.staff_sn).id
		end
		
		if Document.find_by(code: self.document_sn) != nil
			self.document_id = Document.find_by(code: self.document_sn).id
		end
	end


end
