require 'rails_helper'

RSpec.describe "enju_root/works/index", type: :view do
  before(:each) do
    assign(:works, [
      EnjuRoot::Work.create!(),
      EnjuRoot::Work.create!()
    ])
  end

  it "renders a list of works" do
    render
  end
end
