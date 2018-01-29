class CreateBorrowRecords < ActiveRecord::Migration
  def change
    create_table :borrow_records do |t|
      t.string :document_id
      t.string :staff_id
      t.string :description

      t.timestamps null: false
    end
  end
end
