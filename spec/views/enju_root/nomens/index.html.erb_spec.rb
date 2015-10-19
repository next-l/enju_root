require 'rails_helper'

RSpec.describe "nomen/index", type: :view do
  before(:each) do
    assign(:nomen, [
      Nomen.create!(),
      Nomen.create!()
    ])
  end

  it "renders a list of nomen" do
    render
  end
end
