require 'test_helper'

class TroublesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get troubles_index_url
    assert_response :success
  end

  test "should get show" do
    get troubles_show_url
    assert_response :success
  end

  test "should get edit" do
    get troubles_edit_url
    assert_response :success
  end

end
