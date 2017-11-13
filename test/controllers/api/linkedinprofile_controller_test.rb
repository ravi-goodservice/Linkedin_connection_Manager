require 'test_helper'

class Api::LinkedinprofileControllerTest < ActionController::TestCase
  test "should get check_connection_sent" do
    get :check_connection_sent
    assert_response :success
  end

end
