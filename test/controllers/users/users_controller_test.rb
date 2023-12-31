require "test_helper"

class Users::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_users_edit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get users_users_unsubscribe_url
    assert_response :success
  end
end
