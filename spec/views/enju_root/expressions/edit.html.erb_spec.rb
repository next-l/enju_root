require 'rails_helper'

RSpec.describe "expressions/edit", type: :view do
  before(:each) do
    @expression = assign(:expression, EnjuRoot::Expression.create!())
  end

  it "renders the edit expression form" do
    render

    assert_select "form[action=?][method=?]", expression_path(@expression), "post" do
    end
  end
end
