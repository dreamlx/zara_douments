class OpRecord < ActiveRecord::Base

	validates :staff_sn, presence: true
	validates :document_sn, presence: true
	validates :description, presence: true
	validates :status, presence: true
	# validate :exit_document
	# def exit_document
	# 	docment = Document.find_by(code: self.document_sn)
	# 	if document.blank? or document.nil?
	# 		self.errors.add(:document_sn, self.document_sn + ' document_sn not exist!')
	# 	end
	# end

	validate :check_staff_team

	def check_staff_team
		if self.document_sn
			document = Document.find_by(code: self.document_sn)
			self.errors.add(:document_sn, 'document_sn no in Status') unless document
			return unless document
		end

		if self.staff_sn
			staff = Staff.find_by(code: self.staff_sn)
			if staff and self.staff_sn != 'admin'
				self.errors.add(:staff_sn, 'team of document no match staff\'s team') unless staff.team_id == document.team_id
			end
		end
	end

	belongs_to :staff
	belongs_to :document
	belongs_to :warehouse
	
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
					self.document.status = 'IN'
				when 'borrow'
					self.document.status = 'OUT'
					self.document.last_return_day = self.last_return_day
					self.document.description = self.document.description.to_s + '/br' + "#{self.staff.name} OUT at #{Time.now}"
					self.description = self.description.to_s + '/br' + "#{self.staff.name} OUT at #{Time.now}"
				when 'return'
					self.document.status = 'IN'
					self.document.last_return_day = self.created_at
				when 'remove'
					self.document.status = 'REMOVED'
					self.barcode = self.document.barcode
					self.document.description = self.document.description.to_s + '/br' + "#{self.staff.name} Removed at #{Time.now}"
					self.description = self.description.to_s + '/br' + "#{self.staff.name} Remove at #{Time.now}"
				end
				self.document.save
		end
	end


end
