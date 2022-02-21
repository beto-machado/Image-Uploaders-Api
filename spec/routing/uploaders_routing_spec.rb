require "rails_helper"

RSpec.describe UploadersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/uploaders").to route_to("uploaders#index")
    end

    it "routes to #show" do
      expect(get: "/uploaders/1").to route_to("uploaders#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/uploaders").to route_to("uploaders#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/uploaders/1").to route_to("uploaders#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/uploaders/1").to route_to("uploaders#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/uploaders/1").to route_to("uploaders#destroy", id: "1")
    end
  end
end
