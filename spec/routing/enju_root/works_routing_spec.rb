require "rails_helper"

module EnjuRoot
  RSpec.describe WorksController, type: :routing do
    routes {EnjuRoot::Engine.routes}

    describe "routing" do

      it "routes to #index" do
        expect(:get => "/works").to route_to("enju_root/works#index")
      end

      it "routes to #new" do
        expect(:get => "/works/new").to route_to("enju_root/works#new")
      end

      it "routes to #show" do
        expect(:get => "/works/1").to route_to("enju_root/works#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/works/1/edit").to route_to("enju_root/works#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/works").to route_to("enju_root/works#create")
      end

      it "routes to #update via PUT" do
        expect(:put => "/works/1").to route_to("enju_root/works#update", :id => "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/works/1").to route_to("enju_root/works#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/works/1").to route_to("enju_root/works#destroy", :id => "1")
      end

    end
  end
end
