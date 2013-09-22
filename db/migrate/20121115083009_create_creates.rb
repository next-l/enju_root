class CreateCreates < ActiveRecord::Migration
  def change
    create_table :creates do |t|
      t.references :work
      t.references :agent

      t.timestamps
    end
    add_index :creates, :work_id
    add_index :creates, :agent_id
  end
end
