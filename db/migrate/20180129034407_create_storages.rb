class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string :title
      t.string :code
      t.string :status

      t.timestamps null: false
    end
  end
end
