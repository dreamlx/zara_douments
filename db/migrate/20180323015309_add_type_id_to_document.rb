class AddTypeIdToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :team_type_id, :integer
  end
end
