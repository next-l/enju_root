class CreateNomina < ActiveRecord::Migration
  def change
    create_table :nomina do |t|
      t.string :name
      t.string :scheme

      t.timestamps null: false
    end
  end
end
