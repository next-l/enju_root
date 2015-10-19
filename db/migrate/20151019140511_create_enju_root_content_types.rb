class CreateEnjuRootContentTypes < ActiveRecord::Migration
  def change
    create_table :enju_root_content_types do |t|
      t.string :name
      t.text :display_name
      t.text :note
      t.integer :position

      t.timestamps null: false
    end
  end
end
