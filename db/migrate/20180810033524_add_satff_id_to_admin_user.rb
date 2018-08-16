class AddSatffIdToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :staff_id, :integer
  end
end
