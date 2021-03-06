ActiveAdmin.register Document do


  actions :index, :show, :create, :edit, :update, :new
  permit_params :title, :code, :staff_id, :storage_id, 
                :description, :city_id, :status, :team_id, 
                :legal_entity_id, :last_return_day, :team_type_id, :create_date, :barcode, :location
  remove_filter :op_records
  #filter :title
  filter :code 
  filter :staff, as: :select, collection: Staff.all.order(:name)
  filter :storage, as: :select, collection: Storage.all.map{|s| [s.code, s.id]}
  filter :city
  filter :create_date
  filter :last_return_day
  filter :status, as: :select, collection: ['IN', 'OUT', 'REMOVED', 'DESTROY']
  filter :legal_entity

  filter :team, as: :select, collection: proc { 
    
      if current_admin_user.staff && current_admin_user.staff.team
        Team.where(id: current_admin_user.staff.team.id)
      else
        Team.all
      end

  }

  filter :team_type
  filter :description
  filter :barcode


  belongs_to :storage, optional: true

  menu priority: 5, label: 'Status' # so it's on the very left

	sidebar "my records", only: [:show] do
    ul do
      li link_to "Records",    admin_document_op_records_path(resource)
    end
  end

  csv do
    #column :id
    column :code, label: '\xEF\xBB\xBFCode' do |d|
      d.code
    end
    column :barcode
    column :storage do |d|
      d.storage.code if d.storage
    end
    column :legal_entity do |d|
      d.legal_entity.title if d.legal_entity
    end
    column :team do |d|
      d.team.title if d.team
    end
    column :team_type do |d|
      d.team_type.title if d.team_type
    end
    column :city do |d|
      d.city.title if d.city
    end
    column :description
    column :last_return_day
    column :location
    column :status
    column :create_date
    # 变更未+8 北京时间
    column :updated_at do |d|
      d.updated_at.in_time_zone('Beijing')
    end
  end


  controller do
    def scoped_collection
      unless current_admin_user.staff.nil?
        Document.where(:team_id => current_admin_user.staff.team.id) 
      else
        Document.all
      end
    end
  end

  index do
    selectable_column
    #column :id
    column :code
    column :barcode
    column :storage do |d|
			link_to d.storage.code, admin_storage_path(d) if d.storage
		end
    column :legal_entity
    # column :team
    # column :team_type do |d|
    #   d.team_type if d.team_type
    # end
    column :city
    column :location
    column :description
    column :status
    column :create_date
    column :updated_at
    actions
  end

	show do
		attributes_table do
      row :city
      row :location
      row :code
			row :team
      row :team_type
			row :legal_entity
			row :storage do |s|
				s.storage.code
			end
      row :last_return_day
			row :description
			row :status
      row :create_date
    end
    active_admin_comments
	end

   form do |f|
  	f.semantic_errors # shows errors on :base
  	f.inputs do
  		#f.input :title
  		f.input :city
  		f.input :code, hint: 'format: 999999000001, code should been 12 length + 1 => 13'
      f.input :barcode
      f.input :team
      f.input :team_type
      f.input :legal_entity
  		#f.input :staff
  		f.input :storage, collection: Storage.all.map{|s| [s.code, s.id]}
      #f.input :last_return_day
  		f.input :description
      f.input :create_date, as: :datepicker
  		#f.input :status, :collection => [['in','in'],['out','out'],['removed','removed']]
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end
end
