require 'rails_helper'

RSpec.describe "themas/show", type: :view do
  before(:each) do
    @thema = assign(:thema, Thema.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
