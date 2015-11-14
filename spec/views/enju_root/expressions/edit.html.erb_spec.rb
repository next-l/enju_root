require 'rails_helper'

RSpec.describe "enju_root/expressions/edit", type: :view do
  before(:each) do
    @expression = assign(:expression, EnjuRoot::Expression.create!(
      language: EnjuRoot::Language.first,
      content_type: EnjuRoot::ContentType.first
    ))
  end

  it "renders the edit expression form" do
    render

    assert_select "form[action=?][method=?]", enju_root.expression_path(@expression), "post" do
    end
  end
end
