require 'test_helper'

class StaffsControllerTest < ActionController::TestCase
  def setup
    @sadmin = staffs(:jack)
    @admin = staffs(:john)
    @mstaff = staffs(:jill)
  end

  test 'should get edit' do
    session[:email] = @sadmin.email
    get :edit, params: { id: @sadmin.id }
    assert_response :success
  end

  test 'should show administration on super admin staff login' do
    session[:email] = @sadmin.email
    get :edit, params: { id: @sadmin.id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_select '.administration', 1
    assert_select '.staff', 1
  end

  test 'should not show administration on admin staff login' do
    session[:email] = @admin.email
    get :edit, params: { id: @admin.id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_select '.staff', 1
    assert_select '.administration', 0
  end

  test 'should not show administration on managing staff login' do
    session[:email] = @mstaff.email
    get :edit, params: { id: @mstaff.id }
    assert_response :success
    assert_template 'sessions/_session'
    assert_select '.staff', 1
    assert_select '.administration', 0
  end

  test 'should patch data' do
    session[:email] = @admin.email
    patch :update, params: {
      id: @admin.id,
      staff: {
        current_pswd: 'N@kia987',
        new_pswd: 'Y@hoo123',
        cfm_pswd: 'Y@hoo123'
      }
    }
    assert_response :redirect
    assert_redirected_to controller: 'staffs', action: 'edit'
    assert_equal 'Password have been successfully updated.', flash[:info]
  end

  test 'should reject invalid current password' do
    session[:email] = @admin.email
    patch :update, params: {
      id: @admin.id,
      staff: {
        current_pswd: 'Nokia987',
        new_pswd: 'Y@hoo123',
        cfm_pswd: 'Y@hoo123'
      }
    }
    assert_response :redirect
    assert_redirected_to controller: 'staffs', action: 'edit'
    assert_equal 'Entered current password is Invalid.', flash[:error]
  end

  test 'should reject invalid confirm password' do
    session[:email] = @admin.email
    patch :update, params: {
      id: @admin.id,
      staff: {
        current_pswd: 'N@kia987',
        new_pswd: 'Y@hoo123',
        cfm_pswd: 'Yahoo123'
      }
    }
    assert_response :redirect
    assert_redirected_to controller: 'staffs', action: 'edit'
    assert_equal ["Password confirmation doesn't match Password"], flash[:error]
  end
end
