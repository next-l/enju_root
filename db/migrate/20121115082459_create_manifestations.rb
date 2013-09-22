class CreateManifestations < ActiveRecord::Migration
  def change
    create_table :manifestations do |t|
      t.text :preferred_title
      t.references :carrier_type

      t.timestamps
    end
  end
end
