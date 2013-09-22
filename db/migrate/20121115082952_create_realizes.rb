class CreateRealizes < ActiveRecord::Migration
  def change
    create_table :realizes do |t|
      t.references :expression
      t.references :agent

      t.timestamps
    end
    add_index :realizes, :expression_id
    add_index :realizes, :agent_id
  end
end
