class CreateEnjuRootEmbodies < ActiveRecord::Migration
  def change
    create_table :enju_root_embodies do |t|
      t.integer :expression_id
      t.integer :manifestation_id
      t.integer :embody_type_id
      t.text :note

      t.timestamps null: false
    end
    add_index :enju_root_embodies, :expression_id
    add_index :enju_root_embodies, :manifestation_id
  end
end
