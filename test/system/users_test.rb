require "application_system_test_case"

class UsersTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:admin)
  end

  test "visiting the index" do
    get users_url
    assert_select "h2", text: "MEMBERS"
    assert_select ".user-name", count: User.count
    assert_response :success
  end
end
