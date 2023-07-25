require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard_1" do
    get dashboard_dashboard_1_url
    assert_response :success
  end
end
