class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.integer :work_id
      t.string :url

      t.timestamps
    end
    add_index :agents, :work_id
    add_index :agents, :url
  end
end
