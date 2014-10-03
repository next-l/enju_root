class AddUrlToAgent < ActiveRecord::Migration
  def change
    add_column :agents, :url, :string
    add_index :agents, :url
  end
end
