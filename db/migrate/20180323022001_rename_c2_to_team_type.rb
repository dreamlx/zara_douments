class RenameC2ToTeamType < ActiveRecord::Migration
  def change
  	rename_column :team_types, :team_type, :type_name
  end
end
