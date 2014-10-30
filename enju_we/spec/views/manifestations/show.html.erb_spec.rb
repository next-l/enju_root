require 'rails_helper'

RSpec.describe "manifestations/show", :type => :view do
  before(:each) do
    @manifestation = assign(:manifestation, Manifestation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
