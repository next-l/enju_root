require 'rails_helper'

RSpec.describe "enju_root/expressions/new", type: :view do
  before(:each) do
    assign(:expression, EnjuRoot::Expression.new())
  end

  it "renders new expression form" do
    render

    assert_select "form[action=?][method=?]", enju_root.expressions_path, "post" do
    end
  end
end
