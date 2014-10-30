class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.text :title_proper
      t.string :url

      t.timestamps
    end
  end
end
