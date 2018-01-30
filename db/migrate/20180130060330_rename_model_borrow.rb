class RenameModelBorrow < ActiveRecord::Migration
  def change
  	rename_table :borrow_records, :op_records
  end
end
