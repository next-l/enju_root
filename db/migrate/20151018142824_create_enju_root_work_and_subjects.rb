class CreateEnjuRootWorkAndSubjects < ActiveRecord::Migration
  def change
    create_table :enju_root_work_and_subjects do |t|
      t.string :source_url
      t.string :destination_url
      t.integer :relationship_type_id
      t.text :note

      t.timestamps null: false
    end
    add_index :enju_root_work_and_subjects, :source_url
    add_index :enju_root_work_and_subjects, :destination_url
    add_index :enju_root_work_and_subjects, :relationship_type_id
  end
end
