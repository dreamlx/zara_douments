class AddBarcodeToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :barcode, :string
  end
end
