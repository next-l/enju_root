class CreateEnjuRootNomens < ActiveRecord::Migration
  def change
    create_table :enju_root_nomens do |t|

      t.string :name
      t.string :scheme
      t.integer :dimension
      t.integer :parent_id
      t.timestamps null: false
    end
  end
end
