require "rails_helper"

module EnjuRoot
  RSpec.describe ExpressionsController, type: :routing do
    describe "routing" do

      it "routes to #index" do
        expect(:get => "/expressions").to route_to("expressions#index")
      end

      it "routes to #new" do
        expect(:get => "/expressions/new").to route_to("expressions#new")
      end

      it "routes to #show" do
        expect(:get => "/expressions/1").to route_to("expressions#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/expressions/1/edit").to route_to("expressions#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/expressions").to route_to("expressions#create")
      end

      it "routes to #update via PUT" do
        expect(:put => "/expressions/1").to route_to("expressions#update", :id => "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/expressions/1").to route_to("expressions#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/expressions/1").to route_to("expressions#destroy", :id => "1")
      end

    end
  end
end
