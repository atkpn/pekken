require "test_helper"

class Users::BodyInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_body_info_new_url
    assert_response :success
  end
end
