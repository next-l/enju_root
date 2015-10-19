require 'rails_helper'

RSpec.describe "works/edit", type: :view do
  before(:each) do
    @work = assign(:work, Work.create!())
  end

  it "renders the edit work form" do
    render

    assert_select "form[action=?][method=?]", work_path(@work), "post" do
    end
  end
end
