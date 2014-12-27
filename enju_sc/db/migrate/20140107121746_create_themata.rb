class CreateThemata < ActiveRecord::Migration
  def change
    create_table :themata do |t|
      t.string :node
      t.string :term
      t.string :category

      t.timestamps
    end
  end
end
