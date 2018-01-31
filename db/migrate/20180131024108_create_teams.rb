class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :title
      t.string :code

      t.timestamps null: false
    end
  end
end
