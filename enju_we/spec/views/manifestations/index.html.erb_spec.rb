require 'rails_helper'

RSpec.describe "manifestations/index", :type => :view do
  before(:each) do
    assign(:manifestations, [
      Manifestation.create!(),
      Manifestation.create!()
    ])
  end

  it "renders a list of manifestations" do
    render
  end
end
