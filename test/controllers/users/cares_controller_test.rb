require "test_helper"

class Users::CaresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_cares_new_url
    assert_response :success
  end

  test "should get edit" do
    get users_cares_edit_url
    assert_response :success
  end

  test "should get show" do
    get users_cares_show_url
    assert_response :success
  end
end
