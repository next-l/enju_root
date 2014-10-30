class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.string :node
      t.string :term
      t.string :category

      t.timestamps
    end
  end
end
