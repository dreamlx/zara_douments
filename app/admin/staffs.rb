ActiveAdmin.register Staff do
	actions :index, :show, :create, :edit, :update, :new
	remove_filter :op_records
	menu parent: "System"
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
belongs_to :team, optional: true
	permit_params :name, :code, :status, :team_id

 	# sidebar "my records", only: [:show] do
  #   ul do
  #     #li link_to "Documents",    admin_staff_documents_path(resource)
  #     #li link_to "Records",    admin_staff_op_records_path(resource)
  #   end
  # end
end
