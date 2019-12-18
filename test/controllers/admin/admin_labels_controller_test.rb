require 'test_helper'

class Admin::AdminLabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_admin_labels_new_url
    assert_response :success
  end

end
