require 'test_helper'

class Public::PublicCartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_public_cart_items_index_url
    assert_response :success
  end

end
