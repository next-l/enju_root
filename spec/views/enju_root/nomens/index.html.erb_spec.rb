require 'rails_helper'

RSpec.describe "enju_root/nomens/index", type: :view do
  before(:each) do
    assign(:nomen, [
      EnjuRoot::Nomen.create!(),
      EnjuRoot::Nomen.create!()
    ])
  end

  it "renders a list of nomen" do
    render
  end
end
