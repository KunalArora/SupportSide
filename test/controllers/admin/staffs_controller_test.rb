require 'test_helper'

module Admin
  class StaffsControllerTest < ActionController::TestCase
    def setup
      @sadmin = staffs(:jack)
      session[:email] = @sadmin.email
    end

    test 'should show index' do
      get :index
      assert_response :success
      assert_template 'sessions/_session'
      assert_template 'admin/staffs/_back_to_search'
      assert_select 'thead th', 4
    end

    test 'should get new' do
      get :new
      assert_response :success
      assert_template 'sessions/_session'
      assert_template 'admin/staffs/_back_to_search'
      assert_select '.staffinfo', 1
    end

    test 'should post create' do
      post :create, params: {
        staff: {
          name: 'foo',
          company_id: 2,
          email: 'foo@example.com',
          password: 'P@ssw123',
          admin: 'admin'
        }
      }
      assert_response :redirect
      assert_redirected_to controller: 'admin/staffs', action: 'index'
      assert_equal 'New staff created successfully.', flash[:info]
    end

    test 'should reject invalid information' do
      post :create, params: {
        staff: {
          name: 'foo',
          company_id: 2,
          email: 'foo@example.com'
        }
      }
      assert_response 400
      assert_template 'shared/_error_messages'
    end

    test 'should get show' do
      get :show, params: { id: @sadmin.id }
      assert_response :success
      assert_template 'sessions/_session'
      assert_template 'admin/staffs/_back_to_search'
      assert_select '.staffs', 1
      assert_select '.staff', 3
    end

    test 'should get edit' do
      get :edit, params: { id: @sadmin.id }
      assert_response :success
      assert_template 'sessions/_session'
      assert_template 'admin/staffs/_back_to_search'
      assert_select '.staffs', 1
    end

    test 'should patch update changing super admin to admin or managing staff' do
      #     assert_equal "You don't have a permission.", flash[:error]
      patch :update, params: {
        id: @sadmin.id,
        staff: {
          company_id: 1,
          admin: 'mstaff'
        }
      }
      assert_response :redirect
      assert_redirected_to controller: 'admin/staffs', action: 'show'
    end

    test 'should patch update' do
      patch :update, params: {
        id: @sadmin.id,
        staff: {
          company_id: 1,
          name: 'Bar'
        }
      }
      assert_response :redirect
      assert_redirected_to controller: 'admin/staffs', action: 'show'
      assert_equal 'Staff information is updated successfully.', flash[:info]
    end

    test 'should reject invalid update information' do
      patch :update, params: {
        id: @sadmin.id,
        staff: {
          company_id: '',
          name: ''
        }
      }
      assert_response 400
      assert_template :edit
      assert_template 'shared/_error_messages'
    end

    test 'should delete destroy' do
      delete :destroy, params: { id: @sadmin.id }
      assert_response :redirect
      assert_redirected_to controller: 'admin/staffs', action: 'index'
      assert_equal 'Staff deleted successfully.', flash[:info]
    end

    test 'should reject non suder administrator' do
      session[:email] = staffs(:john).email
      get :index
      assert_response 400
    end
  end
end
