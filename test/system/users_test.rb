require "application_system_test_case"

<<<<<<< HEAD
class UsersTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:admin)
  end

  test "visiting the index" do
    get users_url
    assert_select "h1", text: "Users"
    assert_select ".user-name", count: User.count
    assert_response :success
=======
class UsersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/users"

    assert_selector "h1", text: "Users"
>>>>>>> 43053ae... installed kaminari and paginate users
  end
end
