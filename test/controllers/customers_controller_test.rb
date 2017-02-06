require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  def setup
    session[:email] = staffs(:jack).email
    @user = tbl_users(:foo)
  end

  test 'should get show' do
    get :show, params: { uuid: @user.uid }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
  end

  test 'should show user not found' do
    get :show, params: { uuid: '-1' }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.customers .error', 'Customer not found.'
  end

  test 'should show device not registered' do
    get :show, params: { uuid: tbl_users(:bar).uid }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.customers .error', 'No Device Registered.'
  end

  test 'should show paginate' do
    get :show, params: { uuid: tbl_users(:baz).uid }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
  #  assert_select 'table tbody tr', 10
  end
end
