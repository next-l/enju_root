class CreateEnjuRootThemaAndNomens < ActiveRecord::Migration
  def change
    create_table :enju_root_thema_and_nomens do |t|
      t.integer :thema_id
      t.integer :nomen_id

      t.timestamps null: false
    end
    add_index :enju_root_thema_and_nomens, :thema_id
    add_index :enju_root_thema_and_nomens, :nomen_id
  end
end
