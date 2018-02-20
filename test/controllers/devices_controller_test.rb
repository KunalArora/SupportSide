require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  def setup
    session[:email] = staffs(:jack).email
    @user = tbl_users(:foo)
    @device = tbl_user_mfcs(:foo_mfc)
  end

  test 'should get show with device_id' do
    get :show, params: { uuid: @user.uid, device_id: @device.device_id }
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
    get :show, params: {uuid: @user.uid, serial: @device.serial }
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
    get :show, params: { uuid: @user.uid, device_id: '-1' }
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

  test 'should get radio button' do
    get :history_log, params: { device_id: @device.device_id}
    assert_response :success
    assert_select '#1day', 1
    assert_select '#7days', 1
    assert_select '#1month', 1
    assert_select '#1year', 1
    assert_select '#specific_p', 1
    assert_select '#hourly', 1
    assert_select '#monthly', 1
    assert_select '#daily', 1
    assert_select '#consumable', 1
    assert_select '#printcount', 1
    assert_select '#online_1day', 1
    assert_select '#specific_d', 1
  end

  test 'should get text area' do
    get :history_log, params: { device_id: @device.device_id}
    assert_response :success
    assert_select '#from', 1
    assert_select '#to', 1
    assert_select '#text_d', 1
  end

  test 'should get download button' do
    get :history_log, params: { device_id: @device.device_id}
    assert_response :success
    assert_select '#radio_submit_notificaiton', 1
    assert_select '#radio_submit_online', 1
  end

  test 'should get radio button which is disabled' do
    get :history_log, params: { device_id: @device.device_id}
    assert_response :success
    assert_select "#hourly[disabled='disabled']", true
    assert_select "#daily[disabled='disabled']", true
    assert_select "#monthly[disabled='disabled']", true
    assert_select "#from[disabled='disabled']", true
    assert_select "#to[disabled='disabled']", true
    assert_select "#text_d[disabled='disabled']", true
  end

  test 'should get raido button which is checked' do
    get :history_log, params: { device_id: @device.device_id}
    assert_response :success
    assert_select "#1day[checked='checked']", true
    assert_select "#consumable[checked='checked']", true
    assert_select "#online_1day[checked='checked']", true
  end

  test 'should get text field whose placeholder is DD/MM/YYYY' do
    get :history_log, params: { device_id: @device.device_id}
    assert_response :success
    assert_select "#from[placeholder='DD/MM/YYYY']", true
    assert_select "#to[placeholder='DD/MM/YYYY']", true
    assert_select "#text_d[placeholder='DD/MM/YYYY']", true
  end

  test 'should show specific period to sadmin user' do
    get :history_log, params: { device_id: @device.device_id}
    assert_response :success
    assert_select '#specific_p', 1
    assert_select '#from', 1
    assert_select '#to', 1
    assert_select '.time_unit', 1
  end

  test 'should show specific period to loadmin user' do
    session[:email] = staffs(:john).email
    get :history_log, params: { device_id: @device.device_id}
    assert_response :success
    assert_select '#specific_p', 1
    assert_select '#from', 1
    assert_select '#to', 1
    assert_select '.time_unit', 1
  end

  test 'should not show specific period to lomstaff user' do
    session[:email] = staffs(:jill).email
    get :history_log, params: { device_id: @device.device_id}
    assert_response :success
    assert_select '#specific_p', 0
    assert_select '#from', 0
    assert_select '#to', 0
    assert_select '.time_unit', 0
  end

  test 'should not show specific period to sdesk user' do
    session[:email] = staffs(:jordan).email
    get :history_log, params: { device_id: @device.device_id}
    assert_response :success
    assert_select '#specific_p', 0
    assert_select '#from', 0
    assert_select '#to', 0
    assert_select '.time_unit', 0
  end
end
