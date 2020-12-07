require 'test_helper'

class ObjectivesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get objectives_update_url
    assert_response :success
  end

end
