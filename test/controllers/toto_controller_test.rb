require 'test_helper'

class TotoControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get toto_show_url
    assert_response :success
  end

end
