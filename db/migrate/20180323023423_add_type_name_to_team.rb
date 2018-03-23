class AddTypeNameToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :type_name, :string
  end
end
