class CreateEnjuRootExpressions < ActiveRecord::Migration
  def change
    create_table :enju_root_expressions do |t|

      t.integer :work_id
      t.integer :language_id
      t.integer :content_type_id
      t.timestamps null: false
    end
    add_index :enju_root_expressions, :work_id
  end
end
