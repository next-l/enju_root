require 'rails_helper'

RSpec.describe "enju_root/expressions/show", type: :view do
  before(:each) do
    @expression = assign(:expression, EnjuRoot::Expression.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
