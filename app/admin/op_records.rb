ActiveAdmin.register OpRecord  do
actions :index, :show, :create, :new, :update

permit_params :document_id, :staff_id, :description, :staff_sn, :document_sn, :status, :last_return_day
menu label: "Movement", priority: 4 # so it's on the very left
#belongs_to :staff, optional: true
belongs_to :document, optional: true

after_action :set_form, only: [:show, :edit, :update]

  index do
    selectable_column
    id_column
    column :document
    column :staff
    column :description
    column 'movement' do |o|
      o.status
    end
    actions
  end

  controller do
    def set_form
      # @op_record = OpRecord.find(resource)
      # document = Document.find(@op_record.document)
      # unless document.blank?
      #   @op_record.status = document.status
      # end
    end
  end

  form do |f|
  	f.semantic_errors # shows errors on :base
  	f.inputs do
  		f.input :document_sn
  		f.input :staff_sn, hint: " input 'admin' will skip validates"
  		f.input :staff
  		f.input :document

      f.input :last_return_day
      f.input :status, label: 'movement',:collection => [['borrow','borrow'],['return','return'],['remove','remove']]
      f.input :warehouse
      f.input :description
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end
end
