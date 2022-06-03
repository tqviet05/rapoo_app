require "test_helper"

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get Create" do
    get cart_items_Create_url
    assert_response :success
  end
end
