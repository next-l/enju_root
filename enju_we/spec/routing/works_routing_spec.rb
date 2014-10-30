require "rails_helper"

RSpec.describe WorksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/works").to route_to("works#index")
    end

    it "routes to #new" do
      expect(:get => "/works/new").to route_to("works#new")
    end

    it "routes to #show" do
      expect(:get => "/works/1").to route_to("works#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/works/1/edit").to route_to("works#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/works").to route_to("works#create")
    end

    it "routes to #update" do
      expect(:put => "/works/1").to route_to("works#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/works/1").to route_to("works#destroy", :id => "1")
    end

  end
end
