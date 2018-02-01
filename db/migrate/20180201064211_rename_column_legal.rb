class RenameColumnLegal < ActiveRecord::Migration
  def change
  	remove_column :documents, :legal_entity
  	add_column :documents, :legal_entity_id, :integer
  end
end

