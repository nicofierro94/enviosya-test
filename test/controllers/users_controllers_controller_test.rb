require 'test_helper'

class UsersControllersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_controller = users_controllers(:one)
  end

  test "should get index" do
    get users_controllers_url
    assert_response :success
  end

  test "should get new" do
    get new_users_controller_url
    assert_response :success
  end

  test "should create users_controller" do
    assert_difference('UsersController.count') do
      post users_controllers_url, params: { users_controller: {  } }
    end

    assert_redirected_to users_controller_url(UsersController.last)
  end

  test "should show users_controller" do
    get users_controller_url(@users_controller)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_controller_url(@users_controller)
    assert_response :success
  end

  test "should update users_controller" do
    patch users_controller_url(@users_controller), params: { users_controller: {  } }
    assert_redirected_to users_controller_url(@users_controller)
  end

  test "should destroy users_controller" do
    assert_difference('UsersController.count', -1) do
      delete users_controller_url(@users_controller)
    end

    assert_redirected_to users_controllers_url
  end
end
