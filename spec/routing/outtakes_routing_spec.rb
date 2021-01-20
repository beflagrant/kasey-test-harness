require "rails_helper"

RSpec.describe OuttakesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/outtakes").to route_to("outtakes#index")
    end

    it "routes to #new" do
      expect(get: "/outtakes/new").to route_to("outtakes#new")
    end

    it "routes to #show" do
      expect(get: "/outtakes/1").to route_to("outtakes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/outtakes/1/edit").to route_to("outtakes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/outtakes").to route_to("outtakes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/outtakes/1").to route_to("outtakes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/outtakes/1").to route_to("outtakes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/outtakes/1").to route_to("outtakes#destroy", id: "1")
    end
  end
end
