class RenameColumnToTeamType < ActiveRecord::Migration
  def change
  	remove_column :team_types, :name
  	add_column :team_types, :team_id, :integer
  end
end
