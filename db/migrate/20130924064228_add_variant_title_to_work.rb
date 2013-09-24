class AddVariantTitleToWork < ActiveRecord::Migration
  def change
    add_column :works, :variant_title, :text
    add_column :works, :intended_audience, :text
  end
end
