require 'test_helper'

class Admin::AdminArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_admin_artists_new_url
    assert_response :success
  end

end
