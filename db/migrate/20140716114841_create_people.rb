class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :work_id
      t.string :url

      t.timestamps
    end
    add_index :people, :work_id
    add_index :people, :url
  end
end
