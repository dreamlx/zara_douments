ActiveAdmin.register OpRecord  do
actions :index, :show, :create, :new, :update

permit_params :document_id, :staff_id, :description, :staff_sn, :document_sn, :status, :last_return_day, :barcode, :warehouse_id
menu label: "Movement", priority: 4 # so it's on the very left
#belongs_to :staff, optional: true
belongs_to :document, optional: true

filter :staff, as: :select, collection: Staff.all.order(:name)
filter :document
filter :warehouse
filter :description
filter :created_at
filter :updated_at
filter :document_sn
filter :staff_sn
filter :barcode
filter :status, as: :select, collection: ['add', 'borrow', 'return', 'remove', 'destroy']


after_action :set_form, only: [:show, :edit, :update]

  index do
    selectable_column
    id_column
    column :document
    column :staff
    column :last_return_day
    column :warehouse
    column :updated_at
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

    def scoped_collection
      unless current_admin_user.staff.nil?
        ids = ""
        current_admin_user.staff.documents.ids.each do |id|
          ids += "#{id},"
        end
        OpRecord.where("document_id in (#{ids})") 
      else
        OpRecord.all
      end
    end

  end

  form do |f|
  	f.semantic_errors # shows errors on :base
  	f.inputs do
  		f.input :document_sn
  		f.input :staff_sn, hint: " input 'admin' will skip validates"
  		f.input :staff, as: :select, :collection => Staff.all.order('name').map {|staff| [staff.name, staff.id]}
  		f.input :document

      f.input :last_return_day, as: :datepicker
      f.input :status, label: 'movement',:collection => [['borrow','borrow'],['return','return'],['remove','remove'], ['destroy','destroy']]
      f.input :warehouse
      f.input :barcode
      f.input :description
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end
end
