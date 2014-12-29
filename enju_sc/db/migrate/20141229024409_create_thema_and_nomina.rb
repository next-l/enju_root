class CreateThemaAndNomina < ActiveRecord::Migration
  def change
    create_table :thema_and_nomina do |t|
      t.integer :thema_id
      t.integer :nomen_id

      t.timestamps null: false
    end
    add_index :thema_and_nomina, :thema_id
    add_index :thema_and_nomina, :nomen_id
  end
end
