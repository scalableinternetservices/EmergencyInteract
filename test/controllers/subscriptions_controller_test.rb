require 'test_helper'

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = subscriptions(:one)
  end

  test "should get index" do
    get subscriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_subscription_url
    assert_response :success
  end

  test "should show subscription" do
    get subscription_url(@subscription)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscription_url(@subscription)
    assert_response :success
  end

end
