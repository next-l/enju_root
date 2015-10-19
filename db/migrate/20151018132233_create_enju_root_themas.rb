class CreateEnjuRootThemas < ActiveRecord::Migration
  def change
    create_table :enju_root_themas do |t|

      t.string :node
      t.integer :parent_id
      t.timestamps null: false
    end
    add_index :enju_root_themas, :parent_id
  end
end
