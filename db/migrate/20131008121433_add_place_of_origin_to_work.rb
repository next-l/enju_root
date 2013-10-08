class AddPlaceOfOriginToWork < ActiveRecord::Migration
  def change
    add_column :works, :place_of_origin, :text
    add_column :works, :other_distinguishing_characteristic, :text
    add_column :works, :identifier, :string
    add_column :works, :medium_of_performance, :string
    add_column :works, :numeric_designation, :text
    add_column :works, :key, :text
    add_column :works, :signatory_for_treaty, :text
    add_column :works, :authorized_access_point, :text
    add_column :works, :variant_access_point, :text
    add_column :works, :status_of_identification, :string
    add_column :works, :source_consulted, :text
    add_column :works, :cataloguers_note, :text
  end
end
