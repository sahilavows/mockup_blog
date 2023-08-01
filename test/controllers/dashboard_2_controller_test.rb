require "test_helper"

class Dashboard2ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_2_index_url
    assert_response :success
  end
end
