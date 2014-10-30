class CreateWorkAndClassifications < ActiveRecord::Migration
  def change
    create_table :work_and_classifications do |t|
      t.integer :work_id
      t.integer :classification_id

      t.timestamps
    end
  end
end
