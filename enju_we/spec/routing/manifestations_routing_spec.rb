require "rails_helper"

RSpec.describe ManifestationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manifestations").to route_to("manifestations#index")
    end

    it "routes to #new" do
      expect(:get => "/manifestations/new").to route_to("manifestations#new")
    end

    it "routes to #show" do
      expect(:get => "/manifestations/1").to route_to("manifestations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manifestations/1/edit").to route_to("manifestations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manifestations").to route_to("manifestations#create")
    end

    it "routes to #update" do
      expect(:put => "/manifestations/1").to route_to("manifestations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manifestations/1").to route_to("manifestations#destroy", :id => "1")
    end

  end
end
