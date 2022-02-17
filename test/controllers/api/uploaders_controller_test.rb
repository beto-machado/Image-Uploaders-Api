require "test_helper"

class UploadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uploader = uploaders(:one)
  end

  test "should get index" do
    get uploaders_url, as: :json
    assert_response :success
  end

  test "should create uploader" do
    assert_difference('Uploader.count') do
      post uploaders_url, params: { uploader: { } }, as: :json
    end

    assert_response 201
  end

  test "should show uploader" do
    get uploader_url(@uploader), as: :json
    assert_response :success
  end

  test "should update uploader" do
    patch uploader_url(@uploader), params: { uploader: { } }, as: :json
    assert_response 200
  end

  test "should destroy uploader" do
    assert_difference('Uploader.count', -1) do
      delete uploader_url(@uploader), as: :json
    end

    assert_response 204
  end
end
