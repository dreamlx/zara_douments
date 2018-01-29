ActiveAdmin.register Document do
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
# 
permit_params :title, :code, :staff_id, :storage_id, :description, :city_id, :status
belongs_to :storage, optional: true
belongs_to :staff, optional: true
menu priority: 5 # so it's on the very left

	sidebar "my records", only: [:show] do
    ul do
      #li link_to "Documents",    admin_staff_documents_path(resource)
      li link_to "Records",    admin_document_borrow_records_path(resource)
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
  		f.input :status
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end
end
