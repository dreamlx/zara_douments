class CreateTeamTypes < ActiveRecord::Migration
  def change
    create_table :team_types do |t|
      t.string :name
      t.string :team_type

      t.timestamps null: false
    end
  end
end
