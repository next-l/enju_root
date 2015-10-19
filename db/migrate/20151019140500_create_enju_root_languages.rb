class CreateEnjuRootLanguages < ActiveRecord::Migration
  def change
    create_table :enju_root_languages do |t|
      t.string :name
      t.text :display_name
      t.text :note
      t.integer :position

      t.timestamps null: false
    end
  end
end
