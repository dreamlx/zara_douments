class RemoveTeamTypeToTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :team_type, :string
  end
end
