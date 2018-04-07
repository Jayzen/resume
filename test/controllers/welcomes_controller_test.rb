require 'test_helper'

class WelcomesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_url
    assert_response :success
    get login_path
    assert_select "title", full_title("用户登录")
  end
end
