require "test_helper"

class SpellsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spells_index_url
    assert_response :success
  end

  test "should get show" do
    get spells_show_url
    assert_response :success
  end

  test "should get new" do
    get spells_new_url
    assert_response :success
  end

  test "should get edit" do
    get spells_edit_url
    assert_response :success
  end

  test "should get create" do
    get spells_create_url
    assert_response :success
  end

  test "should get update" do
    get spells_update_url
    assert_response :success
  end

  test "should get destroy" do
    get spells_destroy_url
    assert_response :success
  end
end
