require 'rails_helper'

RSpec.describe "expressions/show", :type => :view do
  before(:each) do
    @expression = assign(:expression, Expression.create!(preferred_title: 'test'))
  end

  it "renders attributes in <p>" do
    render
  end
end
