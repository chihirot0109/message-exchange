require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users = Users.all
  end
end
