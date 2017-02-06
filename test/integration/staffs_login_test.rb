require 'test_helper'

class StaffsLoginTest < ActionDispatch::IntegrationTest
  def setup
    @staff = staffs(:jack)
  end

  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: ' ', password: ' ' } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'login with valid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @staff.email, password: 'N@kia987' } }
    assert_redirected_to search_path
    follow_redirect!
    assert_template 'search/query'
    assert_template 'search/_form'
    assert_template 'sessions/_session'
  end

  test 'login with valid information followed by logout' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @staff.email, password: 'N@kia987' } }
    assert logged_in?
    assert_redirected_to search_path
    follow_redirect!
    assert_template 'sessions/_session'
    delete logout_path
    assert_not logged_in?
    assert_redirected_to login_path
    follow_redirect!
    assert_template 'sessions/new'
  end

  test 'session timeout' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @staff.email, password: 'N@kia987' } }
    assert logged_in?
    assert_redirected_to search_path
    follow_redirect!
    assert_template 'search/query'
    assert_template 'search/_form'
    assert_template 'sessions/_session'
    Timecop.travel(45.minutes.from_now) do
      get search_path
      assert_redirected_to login_path
      assert_equal 'You need to sign in before continuing.', flash[:error]
    end
  end
end
