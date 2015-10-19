require 'rails_helper'

RSpec.describe "themas/index", type: :view do
  before(:each) do
    assign(:themas, [
      Thema.create!(),
      Thema.create!()
    ])
  end

  it "renders a list of themas" do
    render
  end
end
