require 'rails_helper'

RSpec.describe "manifestations/edit", :type => :view do
  before(:each) do
    @manifestation = assign(:manifestation, Manifestation.create!())
  end

  it "renders the edit manifestation form" do
    render

    assert_select "form[action=?][method=?]", manifestation_path(@manifestation), "post" do
    end
  end
end
