class RenameLastReturnTimeToDocument < ActiveRecord::Migration
  def change
  	rename_column :documents, :last_return_time, :last_return_day
  	rename_column :op_records, :last_return_time, :last_return_day
  end
end
