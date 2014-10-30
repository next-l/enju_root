class AddWorkUrlToClassification < ActiveRecord::Migration
  def change
    add_column :classifications, :work_url, :string
  end
end
