require 'test_helper'

class ConversationsControllerTest < ActionDispatch::IntegrationTest

  test "should get show" do
    get conversations_1_url
    assert_response :success
  end

  test "should get create" do
    get conversations_url
    assert_response :success
  end

end
