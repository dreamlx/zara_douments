class Document < ActiveRecord::Base
	belongs_to :city
	belongs_to :storage
	belongs_to :staff
	belongs_to :team
	belongs_to :legal_entity
	has_many :op_records
	validates :code, presence: true

	before_update :reset_me
	before_create :reset_me
	after_create :add_op

	def reset_me
		if self.status.blank?
			self.status = 'in_stock'
		end

		if self.title.blank?
			self.title = self.code
		end
	end

	def add_op
		op = OpRecord.new
		op.document_sn = self.code
		op.document_id = self.id
		op.staff_sn = 'admin'
		op.description = "added by admin #{Time.now} "
		op.status = 'add'
		op.save
	end

end
