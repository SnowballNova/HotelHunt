require "test_helper"

class BedroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bedrooms_index_url
    assert_response :success
  end

  test "should get show" do
    get bedrooms_show_url
    assert_response :success
  end

  test "should get new" do
    get bedrooms_new_url
    assert_response :success
  end

  test "should get create" do
    get bedrooms_create_url
    assert_response :success
  end

  test "should get edit" do
    get bedrooms_edit_url
    assert_response :success
  end

  test "should get update" do
    get bedrooms_update_url
    assert_response :success
  end

  test "should get destroy" do
    get bedrooms_destroy_url
    assert_response :success
  end
end
