class AddLastReturnTimeToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :last_return_time, :date
  end
end
