require 'test_helper'

class HeroinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get heroines_index_url
    assert_response :success
  end

  test "should get show" do
    get heroines_show_url
    assert_response :success
  end

  test "should get new" do
    get heroines_new_url
    assert_response :success
  end

end
