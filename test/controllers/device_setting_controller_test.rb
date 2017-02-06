require 'test_helper'

class DeviceSettingControllerTest < ActionController::TestCase
  def setup
    @sadmin = staffs(:jack)
    @admin = staffs(:john)
    @mstaff = staffs(:jill)
    @device = tbl_user_mfcs(:foo_mfc)
    @user = tbl_users(:foo)
  end

  test 'should get show' do
    session[:email] = @sadmin.email
    get :show, params: { device_id: @device.device_id }
    assert_response :success
    assert_select '.device_setting', 1
    assert_template 'devices/_back_to_customer'
    assert_template '_back_to_devices'
  end

  test 'should get setting' do
    session[:email] = @sadmin.email
    get :setting, params: { uuid: @user.uid, device_id: @device.device_id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.data', 1
  end

  test 'should get reboot device' do
    session[:email] = @sadmin.email
    get :reboot_device, params: { uuid: @user.uid, device_id: @device.device_id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.data', 1
  end

  test 'should get delete device' do
    session[:email] = @sadmin.email
    get :delete_device, params: { uuid: @user.uid, device_id: @device.device_id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.data', 1
  end

  test 'should get enable log' do
    session[:email] = @sadmin.email
    get :enable_log, params: { uuid: @user.uid, device_id: @device.device_id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.data', 1
  end

  test 'should get device search' do
    session[:email] = @sadmin.email
    get :device_search, params: { uuid: @user.uid, device_id: @device.device_id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.device_search_data', 1
  end

  test 'should show only get device setting button on managing staff login' do
    session[:email] = @mstaff.email
    get :show, params: { device_id: @device.device_id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.device_setting', 1
    assert_select '#bsetting', 1
    assert_select '.bright', 0
  end

  test 'should show all buttons on admin login' do
    session[:email] = @admin.email
    get :show, params: { device_id: @device.device_id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.device_setting', 1
    assert_select '#bsetting', 1
    assert_select '.bright', 3
  end

  test 'should show all buttons on super admin login' do
    session[:email] = @sadmin.email
    get :show, params: { device_id: @device.device_id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.device_setting', 1
    assert_select '#bsetting', 1
    assert_select '.bright', 3
  end

  test 'should show data when get device status button is clicked' do
    session[:email] = @sadmin.email
    get :show, params: {
      device_id: @device.device_id,
      link: 'device_and_network_setting'
    }
    assert_response :success
    assert_select '.device_setting', 1
  end

  test 'should show data when delete device button is clicked' do
    session[:email] = @sadmin.email
    get :show, params: {
      device_id: @device.device_id,
      link: 'delete_device'
    }
    assert_response :success
    assert_select '.device_setting', 1
  end

  test 'should show data when reboot device button is clicked' do
    session[:email] = @sadmin.email
    get :show, params: {
      device_id: @device.device_id,
      link: 'reboot_device'
    }
    assert_response :success
    assert_select '.device_setting', 1
  end

  test 'should show data when enable device log button is clicked' do
    session[:email] = @sadmin.email
    get :show, params: {
      device_id: @device.device_id,
      link: 'enable_device_log'
    }
    assert_response :success
    assert_select '.device_setting', 1
  end
end
