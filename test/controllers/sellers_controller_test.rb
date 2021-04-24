require "test_helper"

class SellersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sellers_index_url
    assert_response :success
  end

  test "should get show" do
    get sellers_show_url
    assert_response :success
  end

  test "should get edit" do
    get sellers_edit_url
    assert_response :success
  end

  test "should get update" do
    get sellers_update_url
    assert_response :success
  end
end
