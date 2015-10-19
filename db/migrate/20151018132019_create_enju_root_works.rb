class CreateEnjuRootWorks < ActiveRecord::Migration
  def change
    create_table :enju_root_works do |t|

      t.text :preferred_title
      t.integer :form_of_work_id
      t.timestamps null: false
    end
  end
end
