class AddTeamIdToTables < ActiveRecord::Migration
  def change
  	add_column :staffs, :team_id, :integer
  	add_column :op_records, :team_id, :integer
  end
end
