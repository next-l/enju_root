require 'rails_helper'

RSpec.describe "works/new", type: :view do
  before(:each) do
    assign(:work, Work.new())
  end

  it "renders new work form" do
    render

    assert_select "form[action=?][method=?]", works_path, "post" do
    end
  end
end
