require 'test_helper'

class GamessControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get gamess_create_url
    assert_response :success
  end

  test "should get show" do
    get gamess_show_url
    assert_response :success
  end

  test "should get new" do
    get gamess_new_url
    assert_response :success
  end

  test "should get index" do
    get gamess_index_url
    assert_response :success
  end

  test "should get edit" do
    get gamess_edit_url
    assert_response :success
  end

  test "should get update" do
    get gamess_update_url
    assert_response :success
  end

  test "should get destoy" do
    get gamess_destoy_url
    assert_response :success
  end

end
