require 'test_helper'

class Admin::AdminGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_admin_genres_new_url
    assert_response :success
  end

end
