require 'rails_helper'

RSpec.describe "enju_root/works/edit", type: :view do
  before(:each) do
    @work = assign(:work, EnjuRoot::Work.create!(
      preferred_title: 'test'
    ))
  end

  it "renders the edit work form" do
    render

    assert_select "form[action=?][method=?]", enju_root.work_path(@work), "post" do
    end
  end
end
