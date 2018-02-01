class OpRecord < ActiveRecord::Base

	validates :staff_sn, presence: true
	validates :document_sn, presence: true
	validates :description, presence: true

	# validate :exit_document
	# def exit_document
	# 	docment = Document.find_by(code: self.document_sn)
	# 	if document.blank? or document.nil?
	# 		self.errors.add(:document_sn, self.document_sn + ' document_sn not exist!')
	# 	end
	# end

	validate :check_staff_team

	def check_staff_team
		if self.staff_sn
			staff = Staff.find_by(code: self.staff_sn)
			document = Document.find_by(code: self.document_sn)
			if staff and document
				unless staff.team_id == document.team_id
					self.errors.add(:staff_sn, 'team of document no match staff\'s team')
				end
			else
				if self.staff_sn == 'admin'
				else
					self.errors.add(:staff_sn, 'team of document no match staff\'s team')
				end
				
			end
		end
	end

	belongs_to :staff
	belongs_to :document
	
	before_update :reset_me
	before_create :reset_me

	after_save :change_status

	def reset_me
		if Staff.find_by(code: self.staff_sn) != nil
			self.staff_id = Staff.find_by(code: self.staff_sn).id
		end
		
		if Document.find_by(code: self.document_sn) != nil
			self.document_id = Document.find_by(code: self.document_sn).id
		end
	end

	def change_status
		if self.document
			case self.status
				when 'add'
					self.document.status = 'in'
				when 'borrow'
					self.document.status = 'out'
				when 'return'
					self.document.status = 'out'
				when 'remove'
					self.document.status = 'removed'
				end
				self.document.save
		end
	end


end
