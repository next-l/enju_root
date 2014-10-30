require 'rails_helper'

RSpec.describe "manifestations/new", :type => :view do
  before(:each) do
    assign(:manifestation, Manifestation.new())
  end

  it "renders new manifestation form" do
    render

    assert_select "form[action=?][method=?]", manifestations_path, "post" do
    end
  end
end
