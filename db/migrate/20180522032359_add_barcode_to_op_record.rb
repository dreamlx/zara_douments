class AddBarcodeToOpRecord < ActiveRecord::Migration
  def change
    add_column :op_records, :barcode, :string
  end
end
