class CreateEnjuRootManifestations < ActiveRecord::Migration
  def change
    create_table :enju_root_manifestations do |t|
      t.string :manifestation_url

      t.timestamps null: false
    end
    add_index :enju_root_manifestations, :manifestation_url
  end
end
