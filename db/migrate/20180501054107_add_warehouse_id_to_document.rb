class AddWarehouseIdToDocument < ActiveRecord::Migration
  def change
    add_column :op_records, :warehouse_id, :integer
  end
end
