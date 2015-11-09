require 'rails_helper'

RSpec.describe "enju_root/themas/edit", type: :view do
  before(:each) do
    @thema = assign(:thema, EnjuRoot::Thema.create!())
  end

  it "renders the edit thema form" do
    render

    assert_select "form[action=?][method=?]", enju_root.thema_path(@thema), "post" do
    end
  end
end
