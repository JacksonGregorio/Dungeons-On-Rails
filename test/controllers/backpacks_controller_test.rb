require "test_helper"

class BackpacksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backpacks_index_url
    assert_response :success
  end

  test "should get show" do
    get backpacks_show_url
    assert_response :success
  end

  test "should get new" do
    get backpacks_new_url
    assert_response :success
  end

  test "should get edit" do
    get backpacks_edit_url
    assert_response :success
  end

  test "should get create" do
    get backpacks_create_url
    assert_response :success
  end

  test "should get update" do
    get backpacks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get backpacks_destroy_url
    assert_response :success
  end
end
