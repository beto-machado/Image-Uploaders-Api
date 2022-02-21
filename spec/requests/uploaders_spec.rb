require 'rails_helper'

RSpec.describe "Uploaders", type: :request do
  describe "GET /api/uploaders" do
    it "response 200 Ok" do
      get api_uploaders_path
      expect(response).to have_http_status(200)
    end

    it "index - JSON 200 Ok" do
      get '/api/uploaders.json'
      expect(response.body).to include_json([
        id: 1,
        created_at: "2022-02-20T01:56:09.854Z",
        updated_at: "2022-02-20T01:56:09.871Z",
        slug: "07917d",
      ])
    end

    it "show - JSON 200 Ok" do
      get '/api/uploaders/07917d.json'
      expect(response.body).to include_json(
        id: 1
      )
    end
  end
end
