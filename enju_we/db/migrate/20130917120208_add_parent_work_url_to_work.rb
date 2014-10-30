class AddParentWorkUrlToWork < ActiveRecord::Migration
  def change
    add_column :works, :parent_work_url, :text
  end
end
