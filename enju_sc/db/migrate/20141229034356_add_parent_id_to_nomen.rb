class AddParentIdToNomen < ActiveRecord::Migration
  def change
    add_column :nomina, :parent_id, :integer
    add_index :nomina, :parent_id
  end
end
