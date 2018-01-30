ActiveAdmin.register Document do
actions :index, :show, :create, :edit, :update, :new
permit_params :title, :code, :staff_id, :storage_id, :description, :city_id, :status
belongs_to :storage, optional: true
belongs_to :staff, optional: true
menu priority: 5, label: '文档箱管理' # so it's on the very left

	sidebar "my records", only: [:show] do
    ul do
      #li link_to "Documents",    admin_staff_documents_path(resource)
      li link_to "Records",    admin_document_op_records_path(resource)
    end
  end

   form do |f|
  	f.semantic_errors # shows errors on :base
  	f.inputs do
  		f.input :title
  		f.input :city
  		f.input :code
  		f.input :staff
  		f.input :storage
  		f.input :description
  		f.input :status, :collection => [['in_stock','in_stock'],['borrowed','borrowed'],['returned','returned'],['cleared','cleared']]
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end
end
