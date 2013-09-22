class RenameManifestation < ActiveRecord::Migration
  def up
    rename_column :manifestations, :preferred_title, :title_proper
  end

  def down
    rename_column :manifestations, :title_proper, :preferred_title
  end
end
