require "rails_helper"

module EnjuRoot
  RSpec.describe ThemasController, type: :routing do
    routes {EnjuRoot::Engine.routes}

    describe "routing" do

      it "routes to #index" do
        expect(:get => "/themas").to route_to("enju_root/themas#index")
      end

      it "routes to #new" do
        expect(:get => "/themas/new").to route_to("enju_root/themas#new")
      end

      it "routes to #show" do
        expect(:get => "/themas/1").to route_to("enju_root/themas#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/themas/1/edit").to route_to("enju_root/themas#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/themas").to route_to("enju_root/themas#create")
      end

      it "routes to #update via PUT" do
        expect(:put => "/themas/1").to route_to("enju_root/themas#update", :id => "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/themas/1").to route_to("enju_root/themas#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/themas/1").to route_to("enju_root/themas#destroy", :id => "1")
      end

    end
  end
end
