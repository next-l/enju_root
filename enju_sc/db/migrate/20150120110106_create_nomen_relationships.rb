class CreateNomenRelationships < ActiveRecord::Migration
  def change
    create_table :nomen_relationships do |t|
      t.integer :parent_id
      t.integer :child_id
      t.integer :nomen_relationship_id
      t.integer :position

      t.timestamps null: false
    end
    add_index :nomen_relationships, :parent_id
    add_index :nomen_relationships, :child_id
  end
end
