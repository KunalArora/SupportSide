class SessionsController < ApplicationController
  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(session_params)
    session_staff = Staff.find_by(email: params[:session][:email])
    if log_in(session_staff, params[:session][:password])
      redirect_to return_path(search_path)
    else
      flash.now[:error] = 'Invalid email/password combination.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
