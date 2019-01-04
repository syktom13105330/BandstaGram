require 'test_helper'

class MediaControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get media_new_url
    assert_response :success
  end

end
