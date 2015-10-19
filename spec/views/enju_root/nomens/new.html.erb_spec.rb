require 'rails_helper'

RSpec.describe "nomen/new", type: :view do
  before(:each) do
    assign(:noman, Nomen.new())
  end

  it "renders new noman form" do
    render

    assert_select "form[action=?][method=?]", nomen_path, "post" do
    end
  end
end
