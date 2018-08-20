class OpRecord < ActiveRecord::Base

	#validates :staff_sn, presence: true
	#validates :document_sn, presence: true
	#validates :description, presence: true
	validates :status, presence: true
	#validates :staff_id, presence: true

	
	#Todo:
	#remove 时候必填
	#validates :barcode, presence: true
	#
	
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
			if staff and self.staff_sn != 'admin' and staff.team.title != 'chinaphan'
				self.errors.add(:staff_sn, 'team of document no match staff\'s team') unless staff.team_id == document.team_id
			end
		end

		if self.staff_sn.blank? and self.staff_id.blank?
			self.errors.add(:staff_sn, 'staff sn 和 staff 不能都为空') 
		end

		if Staff.find_by(code: self.staff_sn) != nil
			self.staff_id = Staff.find_by(code: self.staff_sn).id
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
					self.document.location = self.staff.name unless self.staff.nil?
					self.description = self.description.to_s + '/br' + " IN at #{Time.now}"
				when 'borrow'
					self.document.status = 'OUT'
					self.document.last_return_day = self.last_return_day
					self.document.description = self.document.description.to_s + '/br' + "#{self.staff.name} OUT at #{Time.now}"
					self.description = self.description.to_s + '/br' + " OUT at #{Time.now}"
					self.document.location = self.staff.name unless self.staff.nil?
				when 'return'
					self.document.status = 'IN'
					self.document.last_return_day = self.created_at
					self.document.location = ''
					self.description = self.description.to_s + '/br' + " IN at #{Time.now}"

					self.document.description = ''

				when 'remove'
					self.document.status = 'REMOVED'
					self.document.barcode = self.barcode
					self.document.description = self.document.description.to_s + '/br' + "#{self.staff.name} Removed at #{Time.now}"
					self.description = self.description.to_s + '/br' + " Remove at #{Time.now}"
					self.document.location = self.warehouse.title if self.warehouse
				when 'destroy'
					self.document.status = 'DESTROY'
					self.document.location = self.warehouse.title if self.warehouse
					self.description = self.description.to_s + '/br' + "#{self.staff.name} Destroy at #{Time.now}"
				end
				self.document.save
		end
	end


end
