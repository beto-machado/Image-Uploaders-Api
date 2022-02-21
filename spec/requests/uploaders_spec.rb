require 'rails_helper'

RSpec.describe "/api/uploaders", type: :request do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # UploadersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Uploader.create! valid_attributes
      get uploaders_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      uploader = Uploader.create! valid_attributes
      get uploader_url(uploader), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Uploader" do
        expect {
          post uploaders_url,
               params: { uploader: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Uploader, :count).by(1)
      end

      it "renders a JSON response with the new uploader" do
        post uploaders_url,
             params: { uploader: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Uploader" do
        expect {
          post uploaders_url,
               params: { uploader: invalid_attributes }, as: :json
        }.to change(Uploader, :count).by(0)
      end

      it "renders a JSON response with errors for the new uploader" do
        post uploaders_url,
             params: { uploader: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested uploader" do
        uploader = Uploader.create! valid_attributes
        patch uploader_url(uploader),
              params: { uploader: new_attributes }, headers: valid_headers, as: :json
        uploader.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the uploader" do
        uploader = Uploader.create! valid_attributes
        patch uploader_url(uploader),
              params: { uploader: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the uploader" do
        uploader = Uploader.create! valid_attributes
        patch uploader_url(uploader),
              params: { uploader: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested uploader" do
      uploader = Uploader.create! valid_attributes
      expect {
        delete uploader_url(uploader), headers: valid_headers, as: :json
      }.to change(Uploader, :count).by(-1)
    end
  end
end
