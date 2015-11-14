require 'rails_helper'

RSpec.describe "enju_root/expressions/show", type: :view do
  fixtures :all

  before(:each) do
    @expression = assign(:expression, EnjuRoot::Expression.create!(
      language: EnjuRoot::Language.first,
      content_type: EnjuRoot::ContentType.first
    ))
  end

  it "renders attributes in <p>" do
    render
  end
end
