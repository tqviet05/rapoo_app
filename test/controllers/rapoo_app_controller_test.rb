require "test_helper"

class RapooAppControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get rapoo_app_home_url
    assert_response :success
  end
end
