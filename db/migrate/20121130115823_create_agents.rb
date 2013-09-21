class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.text :full_name
      t.integer :agent_type_id

      t.timestamps
    end
  end
end
