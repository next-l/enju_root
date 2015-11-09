require "rails_helper"

module EnjuRoot
  RSpec.describe NomensController, type: :routing do
    routes {EnjuRoot::Engine.routes}

    describe "routing" do

      it "routes to #index" do
        expect(:get => "/nomens").to route_to("enju_root/nomens#index")
      end

      it "routes to #new" do
        expect(:get => "/nomens/new").to route_to("enju_root/nomens#new")
      end

      it "routes to #show" do
        expect(:get => "/nomens/1").to route_to("enju_root/nomens#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/nomens/1/edit").to route_to("enju_root/nomens#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/nomens").to route_to("enju_root/nomens#create")
      end

      it "routes to #update via PUT" do
        expect(:put => "/nomens/1").to route_to("enju_root/nomens#update", :id => "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/nomens/1").to route_to("enju_root/nomens#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/nomens/1").to route_to("enju_root/nomens#destroy", :id => "1")
      end

    end
  end
end
