class StaffsController < ApplicationController
  before_action :session_required

  def edit
    @staff = Staff.find(params[:id])
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.try(:authenticate, params[:staff][:current_pswd])
      update_password(@staff, *params[:staff].values_at(:new_pswd, :cfm_pswd))
    else
      flash[:error] = 'Entered current password is Invalid.'
    end
    redirect_to edit_staff_path(@staff)
  end

  private

  def staff_params
    params.require(:staff).permit(:password)
  end

  def update_password staff, new_pswd, cfm_pswd
    staff.password = new_pswd
    staff.password_confirmation = cfm_pswd
    if staff.save
      flash[:info] = 'Password have been successfully updated.'
    else
      flash[:error] = staff.errors.full_messages
    end
  end
end
