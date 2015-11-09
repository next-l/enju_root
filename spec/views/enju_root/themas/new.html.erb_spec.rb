require 'rails_helper'

RSpec.describe "enju_root/themas/new", type: :view do
  before(:each) do
    assign(:thema, EnjuRoot::Thema.new())
  end

  it "renders new thema form" do
    render

    assert_select "form[action=?][method=?]", enju_root.themas_path, "post" do
    end
  end
end
