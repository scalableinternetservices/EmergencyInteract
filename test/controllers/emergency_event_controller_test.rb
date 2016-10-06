require 'test_helper'

class EmergencyEventControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get emergency_event_new_url
    assert_response :success
  end

end
