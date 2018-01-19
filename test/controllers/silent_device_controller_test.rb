require 'test_helper'

class SilentDeviceControllerTest < ActionController::TestCase

  def setup
    @sadmin = staffs(:jack)
    @admin = staffs(:john)
    @mstaff = staffs(:jill)
    @device = tbl_user_mfcs(:silent_mfc)
    @user = tbl_users(:silent)
  end

  test 'should get show' do
    session[:email] = @sadmin.email
    get :show
    assert_response :success
    assert_select '#silent_form', 1
  end

  test 'should get search with silent device list' do
    session[:email] = @sadmin.email
    get :search, params: {unresponsive_search: {days: 1}}
    assert_response :success
    assert_select '#silent_form', 1
    assert_select '.silent_device_list table', 1
    assert_select '#silent_empty', 0
  end

  test 'should get search without silent device list' do
    session[:email] = @sadmin.email
    get :search, params: {unresponsive_search: {days: 3}}
    assert_response :success
    assert_select '#silent_form', 1
    assert_select '.silent_device_list table', 0
    assert_select '#silent_empty', 1
  end
end
