require "test_helper"

class MainsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get mains_home_url
    assert_response :success
  end
end
