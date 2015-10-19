require 'rails_helper'

RSpec.describe "themas/new", type: :view do
  before(:each) do
    assign(:thema, Thema.new())
  end

  it "renders new thema form" do
    render

    assert_select "form[action=?][method=?]", themas_path, "post" do
    end
  end
end
