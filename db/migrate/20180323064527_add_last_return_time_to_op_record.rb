class AddLastReturnTimeToOpRecord < ActiveRecord::Migration
  def change
    add_column :op_records, :last_return_time, :date
  end
end
