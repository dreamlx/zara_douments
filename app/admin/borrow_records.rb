ActiveAdmin.register BorrowRecord do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :document_id, :staff_id, :description, :staff_sn, :document_sn
menu priority: 4 # so it's on the very left
belongs_to :staff, optional: true
belongs_to :document, optional: true

after_action :set_form, only: [:show, :edit, :update, :destroy]

  controller do
    def set_form
      @borrow_record = BorrowRecord.find(resource)
      document = Document.find(@borrow_record.document)
      if document.status != 'in_stock'
      	document.status = 'borrowed'
      else
      	document.status = 'in_stock'
      end
      document.save
    end
  end

  form do |f|
  	f.semantic_errors # shows errors on :base
  	f.inputs do
  		f.input :document_sn
  		f.input :staff_sn
  		f.input :staff
  		f.input :document
  		f.input :description
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end
end
