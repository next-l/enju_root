require 'rails_helper'

RSpec.describe "expressions/new", :type => :view do
  before(:each) do
    assign(:expression, Expression.new(preferred_title: 'test'))
  end

  it "renders new expression form" do
    render

    assert_select "form[action=?][method=?]", expressions_path, "post" do
    end
  end
end
