require "test_helper"

class Users::PetCaresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_pet_cares_new_url
    assert_response :success
  end

  test "should get edit" do
    get users_pet_cares_edit_url
    assert_response :success
  end

  test "should get show" do
    get users_pet_cares_show_url
    assert_response :success
  end
end
