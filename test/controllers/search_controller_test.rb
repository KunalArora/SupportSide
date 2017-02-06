require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  def setup
    session[:email] = staffs(:jack).email
  end

  test 'should get query' do
    get :query
    assert_response :success
    assert_select '.search', 1
    assert_select '.search_form', 1
    assert_template 'sessions/_session'
  end

  test 'should redirect to customers information' do
    uuid = '{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}'
    get :query, params: { search: uuid }
    assert_redirected_to controller: 'customers', action: 'show', uuid: uuid
  end

  test 'should redirect to device information' do
    serial9 = 'XXXXXXXXX'
    get :query, params: { search: serial9 }
    assert_redirected_to controller: 'devices', action: 'show', serial: serial9

    serial15 = 'XXXXXXXXXXXXXXX'
    get :query, params: { search: serial15 }
    assert_redirected_to controller: 'devices', action: 'show', serial: serial15

    device_id = 'XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX'
    get :query, params: { search: device_id }
    assert_redirected_to controller: 'devices', action: 'show', device_id: device_id
  end

  test 'should show error message when receive invalid query' do
    get :query, params: { search: 'xyz' }
    assert_response 400
    assert_select '.error', 'Invalid query parameter.'
    assert_not flash.empty?
  end
end
