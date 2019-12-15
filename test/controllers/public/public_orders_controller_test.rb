require 'test_helper'

class Public::PublicOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get confirm" do
    get public_public_orders_confirm_url
    assert_response :success
  end

  test "should get result" do
    get public_public_orders_result_url
    assert_response :success
  end

  test "should get new" do
    get public_public_orders_new_url
    assert_response :success
  end

end
