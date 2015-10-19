require 'rails_helper'

RSpec.describe "nomen/show", type: :view do
  before(:each) do
    @noman = assign(:noman, Nomen.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
