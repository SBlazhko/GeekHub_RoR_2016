require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cars_create_url
    assert_response :success
  end

  test "should get show" do
    get cars_show_url
    assert_response :success
  end

  test "should get index" do
    get cars_index_url
    assert_response :success
  end

  test "should get edit" do
    get cars_edit_url
    assert_response :success
  end

  test "should get update" do
    get cars_update_url
    assert_response :success
  end

  test "should get destoy" do
    get cars_destoy_url
    assert_response :success
  end

end
