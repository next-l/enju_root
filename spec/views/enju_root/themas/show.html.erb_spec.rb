require 'rails_helper'

RSpec.describe "enju_root/themas/show", type: :view do
  before(:each) do
    @thema = assign(:thema, EnjuRoot::Thema.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
