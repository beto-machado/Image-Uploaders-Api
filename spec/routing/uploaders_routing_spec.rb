require "rails_helper"

RSpec.describe  "Uploaders", type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/uploaders").to route_to("api/uploaders#index")
    end

    it "routes to #show" do
      expect(get: "/api/uploaders/1").to route_to("api/uploaders#show", slug: "1")
    end

    it "routes to #create" do
      expect(post: "/api/uploaders").to route_to("api/uploaders#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/uploaders/1").to route_to("api/uploaders#update", slug: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/uploaders/1").to route_to("api/uploaders#update", slug: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/uploaders/1").to route_to("api/uploaders#destroy", slug: "1")
    end
  end
end
