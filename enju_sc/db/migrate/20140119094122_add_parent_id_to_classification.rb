class AddParentIdToClassification < ActiveRecord::Migration
  def change
    add_column :classifications, :parent_id, :integer
    add_column :classifications, :lft, :integer
    add_column :classifications, :rgt, :integer
    add_column :classifications, :depth, :integer
  end
end
