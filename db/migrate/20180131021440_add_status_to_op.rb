class AddStatusToOp < ActiveRecord::Migration
  def change
  	add_column :op_records, :status, :string
  end
end
