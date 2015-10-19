require 'rails_helper'

RSpec.describe "expressions/index", type: :view do
  before(:each) do
    assign(:expressions, [
      Expression.create!(),
      Expression.create!()
    ])
  end

  it "renders a list of expressions" do
    render
  end
end
