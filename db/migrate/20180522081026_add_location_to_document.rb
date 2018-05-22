class AddLocationToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :location, :string
  end
end
