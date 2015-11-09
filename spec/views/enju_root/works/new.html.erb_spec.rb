require 'rails_helper'

RSpec.describe "enju_root/works/new", type: :view do
  before(:each) do
    assign(:work, EnjuRoot::Work.new())
  end

  it "renders new work form" do
    render

    assert_select "form[action=?][method=?]", enju_root.works_path, "post" do
    end
  end
end
