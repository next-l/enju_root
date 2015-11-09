require 'rails_helper'

RSpec.describe "enju_root/nomens/edit", type: :view do
  before(:each) do
    @noman = assign(:noman, EnjuRoot::Nomen.create!())
  end

  it "renders the edit noman form" do
    render

    assert_select "form[action=?][method=?]", noman_path(@noman), "post" do
    end
  end
end
