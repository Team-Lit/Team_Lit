require 'test_helper'

class Admin::AdminChargesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_admin_charges_edit_url
    assert_response :success
  end

end
