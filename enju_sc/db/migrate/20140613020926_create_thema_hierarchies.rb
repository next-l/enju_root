class CreateThemaHierarchies < ActiveRecord::Migration
  def change
    create_table :thema_hierarchies, :id => false do |t|
      t.integer :ancestor_id, :null => false
      t.integer :descendant_id, :null => false
      t.integer  :generations, :null => false
    end

    add_index :thema_hierarchies, [:ancestor_id, :descendant_id, :generations],
      :unique => true, :name => "tag_anc_desc_udx"

    add_index :thema_hierarchies, [:descendant_id],
      :name => "tag_desc_idx"
  end
end
