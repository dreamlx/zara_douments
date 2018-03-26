ActiveAdmin.register Document do
actions :index, :show, :create, :edit, :update, :new
permit_params :title, :code, :staff_id, :storage_id, 
              :description, :city_id, :status, :team_id, 
              :legal_entity_id, :last_return_time, :team_type_id
remove_filter :op_records
filter :title
filter :code
filter :staff
filter :storage
filter :city
filter :created_at
filter :last_return_time
filter :status, as: :select, collection: ['IN', 'OUT', 'REMOVED']
filter :legal_entity
filter :team
filter :team_type


#filter :by_team, as: :select, collection: Team.all.map {|t| ["#{t.title}||#{t.type_name}", t.id]}

belongs_to :storage, optional: true

menu priority: 5, label: 'Status' # so it's on the very left

	sidebar "my records", only: [:show] do
    ul do
      li link_to "Records",    admin_document_op_records_path(resource)
    end
  end

  csv do
    column :id
    column :code
    column :storage do |d|
      d.storage.code
    end
    column :legal_entity do |d|
      d.legal_entity.title if d.legal_entity
    end
    column :team do |d|
      d.team.title if d.team
    end
    column :team_type do |d|
      d.team_type if d.team_type
    end
    column :city do |d|
      d.city.title if d.city
    end
    column :description
    column :last_return_time
    column :status
  end

  index do
    selectable_column
    column :id
    column :code
    column :storage do |d|
			link_to d.storage.code, admin_storage_path(d)
		end
    column :legal_entity
    column :team
    column :team_type do |d|
      d.team_type if d.team_type
    end
    column :city
    column :last_return_time
    column :status
    actions
  end

	show do
		attributes_table do
      row :city
      row :code
			row :team
      row :team_type
			row :legal_entity
			row :storage do |s|
				s.storage.code
			end
      row :last_return_time
			row :description
			row :status
    end
    active_admin_comments
	end

   form do |f|
  	f.semantic_errors # shows errors on :base
  	f.inputs do
  		#f.input :title
  		f.input :city
  		f.input :code, hint: 'format: 999999000001, code should been 12 length'
      f.input :team
      f.input :team_type
      f.input :legal_entity
  		#f.input :staff
  		f.input :storage, collection: Storage.all.map{|s| [s.code, s.id]}
      f.input :last_return_time
  		f.input :description
  		#f.input :status, :collection => [['in','in'],['out','out'],['removed','removed']]
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end
end
