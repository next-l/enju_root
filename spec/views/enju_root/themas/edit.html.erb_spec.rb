require 'rails_helper'

RSpec.describe "themas/edit", type: :view do
  before(:each) do
    @thema = assign(:thema, Thema.create!())
  end

  it "renders the edit thema form" do
    render

    assert_select "form[action=?][method=?]", thema_path(@thema), "post" do
    end
  end
end
