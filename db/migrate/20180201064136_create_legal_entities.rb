class CreateLegalEntities < ActiveRecord::Migration
  def change
    create_table :legal_entities do |t|
      t.string :title
      t.string :brand
      t.string :abbr
      t.string :body

      t.timestamps null: false
    end
  end
end
