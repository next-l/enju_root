class AddFradAttributesToAgent < ActiveRecord::Migration
  def change
    add_column :agents, :date_of_bitrh, :datetime
    add_column :agents, :date_of_death, :datetime
    add_column :agents, :period_of_activity, :text
    add_column :agents, :title, :text
    add_column :agents, :gender_id, :integer
    add_column :agents, :place_of_birth, :string
    add_column :agents, :place_of_death, :string
    add_column :agents, :country_id, :integer
    add_column :agents, :place_of_residence, :string
    add_column :agents, :affiliation, :string
    add_column :agents, :address, :text
    add_column :agents, :field_of_activity, :text
    add_column :agents, :profession, :string
    add_column :agents, :history, :text
    add_column :agents, :other_information_elements, :text
  end
end
