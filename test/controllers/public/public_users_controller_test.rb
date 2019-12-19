require 'test_helper'

class Public::PublicUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get confirm" do
    get public_public_users_confirm_url
    assert_response :success
  end

  test "should get show" do
    get public_public_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_public_users_edit_url
    assert_response :success
  end

end
