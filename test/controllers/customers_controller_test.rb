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
    assert_select '.pin_link', 1
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
  end

  test 'should not show generate pin link on service desk staff login' do
    session[:email] = staffs(:jordan).email
    get :pin_generate, params: { uuid: @user.uid }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.cust_button', 0
  end

  test 'should get pin generate' do
    get :pin_generate, params: { uuid: @user.uid }
    assert_response :success
    assert_template 'sessions/_session'
    assert_template 'search/_form'
    assert_select '.cust_button', 1
  end

  test 'should show 2 buttons when user has some devices' do
    get :show, params: {uuid: @user.uid}
    assert_response :success
    assert_select '#btn_dl', 1
    assert_select '#btn_submit', 1
  end

  test 'should not show 2 buttons when user does not have any devices' do
    get :show, params: {uuid: tbl_users(:bar).uid}
    assert_response :success
    assert_select '#btn_dl', 0
    assert_select '#btn_submit', 0
  end

  test 'should be unable to press Download Selected Items button when all checkboxes are not checked ' do
    get :show, params: {uuid: @user.uid}
    assert_select "#btn_submit[disabled='disabled']", true
  end
end
