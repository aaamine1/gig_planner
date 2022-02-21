require "test_helper"

class VenuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get venues_index_url
    assert_response :success
  end

  test "should get show" do
    get venues_show_url
    assert_response :success
  end

  test "should get new" do
    get venues_new_url
    assert_response :success
  end

  test "should get create" do
    get venues_create_url
    assert_response :success
  end

  test "should get delete" do
    get venues_delete_url
    assert_response :success
  end

  test "should get edit" do
    get venues_edit_url
    assert_response :success
  end

  test "should get update" do
    get venues_update_url
    assert_response :success
  end
end
