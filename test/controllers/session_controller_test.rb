require "test_helper"

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get authorize" do
    get session_authorize_url
    assert_response :success
  end

  test "should get logout" do
    get session_logout_url
    assert_response :success
  end

  test "should get redirect_to_login" do
    get session_redirect_to_login_url
    assert_response :success
  end
end
