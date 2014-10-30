class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :work_id
      t.string :url

      t.timestamps
    end
    add_index :subjects, :work_id
    add_index :subjects, :url
  end
end
