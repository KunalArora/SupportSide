module SessionsHelper
  def current_staff_email
    session[:email]
  end

  def current_staff
    @current_staff ||= Staff.find_by(email: session[:email])
  end

  def logged_in?
    !current_staff.nil?
  end
end
