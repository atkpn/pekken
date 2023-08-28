require "test_helper"

class Users::PetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_pets_new_url
    assert_response :success
  end

  test "should get show" do
    get users_pets_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_pets_edit_url
    assert_response :success
  end

  test "should get index" do
    get users_pets_index_url
    assert_response :success
  end
end
