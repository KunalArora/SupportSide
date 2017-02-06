require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  def setup
    session[:email] = staffs(:jack).email
    @device = tbl_user_mfcs(:foo_mfc)
  end

  test 'should get show with device_id' do
    get :show, params: { device_id: @device.device_id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.back_to_customer', 1
    assert_select '.to_device_setting', 1
    assert_select '.detail', 1
    assert_select '.network_status', 1
    assert_select '.consumable', 1
    assert_select '.firmware_version', 1
    assert_select '.subscription', 1
    assert_select '.notification', 1
  end

  test 'should get show with serial number' do
    get :show, params: { serial: @device.serial }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.back_to_customer', 1
    assert_select '.to_device_setting', 1
    assert_select '.detail', 1
    assert_select '.network_status', 1
    assert_select '.consumable', 1
    assert_select '.firmware_version', 1
    assert_select '.subscription', 1
    assert_select '.notification', 1
  end

  test 'should get show with 9 digit serial number' do
    get :show, params: { serial: @device.serial[-9, 9] }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
  end

  test 'should show device not found with device_id' do
    get :show, params: { device_id: '-1' }
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.device .error', 'Device not found.'
  end

  test 'should show device not found with serial number' do
    get :show, params: { serial: '-1' }
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.device .error', 'Device not found.'
  end
end
