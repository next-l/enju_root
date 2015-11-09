require 'rails_helper'

RSpec.describe "enju_root/themas/index", type: :view do
  before(:each) do
    assign(:themas, [
      EnjuRoot::Thema.create!(),
      EnjuRoot::Thema.create!()
    ])
  end

  it "renders a list of themas" do
    render
  end
end
