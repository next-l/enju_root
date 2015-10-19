class CreateEnjuRootWorkRelationships < ActiveRecord::Migration
  def change
    create_table :enju_root_work_relationships do |t|
      t.integer :parent_id
      t.integer :child_id
      t.integer :work_relationship_type_id
      t.text :note

      t.timestamps null: false
    end
    add_index :enju_root_work_relationships, :parent_id
    add_index :enju_root_work_relationships, :child_id
  end
end
