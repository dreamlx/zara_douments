class RenameTypeNameToTeamType < ActiveRecord::Migration
  def change
  	rename_column :team_types, :type_name, :title
  end
end
