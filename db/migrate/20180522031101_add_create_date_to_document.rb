class AddCreateDateToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :create_date, :date
  end
end
