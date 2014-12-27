class CreateWorkAndThemata < ActiveRecord::Migration
  def change
    create_table :work_and_themata do |t|
      t.integer :work_id
      t.integer :thema_id

      t.timestamps
    end
  end
end
