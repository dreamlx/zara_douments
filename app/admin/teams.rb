ActiveAdmin.register Team do
actions :index, :show, :create, :edit, :update, :new
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
	permit_params :title, :code

	sidebar "members", only: [:show] do
    ul do
      li link_to "Staffs",    admin_team_staffs_path(resource)
      #li link_to "Records",    admin_staff_op_records_path(resource)
    end
  end


	index do
    selectable_column
    column :id
    column :title
    column :code
    
    actions
  end

end