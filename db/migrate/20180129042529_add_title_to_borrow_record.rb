class AddTitleToBorrowRecord < ActiveRecord::Migration
  def change
  	add_column :borrow_records, :document_sn, :string
  	add_column :borrow_records, :staff_sn, :string
  end
end
