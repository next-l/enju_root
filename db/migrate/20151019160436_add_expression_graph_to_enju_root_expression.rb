class AddExpressionGraphToEnjuRootExpression < ActiveRecord::Migration
  def change
    add_column :enju_root_expressions, :expression_graph_id, :string
    add_column :enju_root_expressions, :expression_graph_filename, :string
    add_column :enju_root_expressions, :expression_graph_size, :integer
    add_column :enju_root_expressions, :expression_graph_content_type, :string
  end
end
