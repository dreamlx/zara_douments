class AddTeamIdToTables < ActiveRecord::Migration
  def change
  	add_column :staffs, :team_id, :integer
  	add_column :documents, :team_id, :integer
  end
end
