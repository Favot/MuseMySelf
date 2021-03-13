require 'test_helper'

class UserJourneyContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_journey_contents_show_url
    assert_response :success
  end

end
