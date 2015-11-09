require 'rails_helper'

RSpec.describe "enju_root/nomens/show", type: :view do
  before(:each) do
    @nomen = assign(:nomen, EnjuRoot::Nomen.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
