class AddParentIdToThema < ActiveRecord::Migration
  def change
    add_column :themata, :parent_id, :integer
    add_column :themata, :lft, :integer
    add_column :themata, :rgt, :integer
    add_column :themata, :depth, :integer
  end
end
