module SessionsAction
  extend ActiveSupport::Concern

  def session_required
    unless session[:email]
      session[:return_to] = request.original_url
      flash[:error] = 'You need to sign in before continuing.'
      redirect_to login_path
    end
  end

  def return_path default
    session.delete(:return_to) || default
  end

  def log_in staff, password
    if staff.try(:authenticate, password)
      session[:email] = staff.email
    else
      false
    end
  end

  def log_out
    reset_session
    session.delete(:email)
  end
end
