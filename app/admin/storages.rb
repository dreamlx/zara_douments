ActiveAdmin.register Storage do
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

permit_params :title, :code, :status

 sidebar "Sotrage Detail", only: [:show] do
   ul do
      li link_to "Documents",    admin_storage_documents_path(resource)
      #li link_to "Milestones", admin_project_milestones_path(resource)
   end
 end

  index do
    selectable_column
    column :code
    #column :status
    column 'items count' do |s|
    	s.documents.select{|r| r.status != 'removed'}.count
    end
    actions
  end

  form do |f|
  	f.semantic_errors # shows errors on :base
  	f.inputs do
  		f.input :title
  		f.input :code
  		#f.input :status, collection: [['atcive','active'],['inactive','inactive']]
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end
end
