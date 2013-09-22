class CreateProduces < ActiveRecord::Migration
  def change
    create_table :produces do |t|
      t.references :manifestation
      t.references :agent

      t.timestamps
    end
    add_index :produces, :manifestation_id
    add_index :produces, :agent_id
  end
end
