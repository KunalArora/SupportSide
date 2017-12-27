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
    assert_select '.consumables', 1
    assert_select '.firmware_version', 1
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
    assert_select '.consumables', 1
    assert_select '.firmware_version', 1
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

  test 'should get subscription' do
    get :subscription, params: { uuid: @device.device_id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.subscription_detail', 1
  end

  test 'should get connection type' do
    ['BOC direct', 'BOAgent(USB)', 'BOAgent(Network)'].each.with_index(5) do |type, i|
      @device = tbl_user_mfcs(:"foo_mfc_#{i}")
      get :show, params: { serial: @device.serial }
      assert_response :success
      assert_select '#connection_type', type
    end
  end

  test 'should get network status' do
    ['Device is Online', 'Device is Online but NOT subscribed', 'Device is Offline',
    'Device is Offline and NOT subscribed'].each.with_index(5) do |status, i|
      @device = tbl_user_mfcs(:"foo_mfc_#{i}")
      get :show, params: { serial: @device.serial }
      assert_response :success
      assert_select '.status_msg', status
    end
  end

  test 'should show color red' do
    [{status: 1, days: 0},{status: 1, days: 1}, {status: 0, days: 1}].each.with_index(6) do |num, i|
      @device = tbl_user_mfcs(:"foo_mfc_#{i}")
      get :show, params: { serial: @device.serial }
      assert_response :success
      assert_select ".font_status", num[:status]
      assert_select ".font_offlinedays", num[:days]
    end
  end

end
