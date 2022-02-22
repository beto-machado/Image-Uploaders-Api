require 'rails_helper'

RSpec.describe "Uploaders", type: :request do

  describe "GET /index" do
    it "renders a successful response" do
      get api_uploaders_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      uploader = Uploader.create(image: fixture_file_upload('image1.jpg', 'image/jpg') )
      get api_uploaders_url(uploader)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new uplaoder" do
        expect {
          post api_uploaders_url, params: { uploader: { image: fixture_file_upload('image1.jpg', 'image/jpg') } }
        }.to change(Uploader, :count).by(1)
      end
    end
  end
end

