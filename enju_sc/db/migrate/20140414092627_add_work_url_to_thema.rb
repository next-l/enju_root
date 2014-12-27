class AddWorkUrlToThema < ActiveRecord::Migration
  def change
    add_column :themata, :work_url, :string
  end
end
