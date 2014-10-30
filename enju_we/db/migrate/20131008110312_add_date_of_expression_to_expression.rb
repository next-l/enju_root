class AddDateOfExpressionToExpression < ActiveRecord::Migration
  def change
    add_column :expressions, :date_of_expression, :datetime
    add_column :expressions, :other_distinguishing_characteristic, :text
    add_column :expressions, :horizontal_scale_of_cartographic_content, :string
    add_column :expressions, :vertical_scale_of_cartographic_content, :string
    add_column :expressions, :authorized_access_point, :text
    add_column :expressions, :variant_access_point, :text
    add_column :expressions, :status_of_identification, :string
    add_column :expressions, :source_consulted, :text
    add_column :expressions, :cataloguers_note, :text
  end
end
