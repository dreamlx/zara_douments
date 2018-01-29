class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :code
      t.string :storage_id
      t.string :staff_id
      t.string :description
      t.string :city_id
      t.string :status

      t.timestamps null: false
    end
  end
end
