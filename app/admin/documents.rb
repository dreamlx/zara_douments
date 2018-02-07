ActiveAdmin.register Document do
actions :index, :show, :create, :edit, :update, :new
permit_params :title, :code, :staff_id, :storage_id, :description, :city_id, :status, :team_id, :legal_entity_id
remove_filter :op_records
belongs_to :storage, optional: true

menu priority: 5, label: 'Status' # so it's on the very left

	sidebar "my records", only: [:show] do
    ul do
      li link_to "Records",    admin_document_op_records_path(resource)
    end
  end

  index do
    selectable_column
    column :code
    column :storage do |d|
			d.storage.code
		end
    column :legal_entity
    column :team
    column :city
    column :description
    column :status
    actions
  end

   form do |f|
  	f.semantic_errors # shows errors on :base
  	f.inputs do
  		#f.input :title
  		f.input :city
  		f.input :code, hint: 'format: 999999000001, code should been 12 length'
      f.input :team
      f.input :legal_entity
  		#f.input :staff
  		f.input :storage
  		f.input :description
  		#f.input :status, :collection => [['in','in'],['out','out'],['removed','removed']]
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end
end
