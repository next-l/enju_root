require 'rails_helper'

RSpec.describe "works/show", :type => :view do
  before(:each) do
    @work = assign(:work, Work.create!(preferred_title: 'test'))
  end

  it "renders attributes in <p>" do
    render
  end
end
