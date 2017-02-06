module Admin
  class StaffsController < ApplicationController
    include SessionsAction
    before_action :session_required
    before_action :admin_required
    before_action :set_staff, only: %w(edit show update destroy)

    def index
      @staffs = Staff.all.paginate(page: params[:page], per_page: 10)
    end

    def new
      @staff = Staff.new
    end

    def edit; end

    def show; end

    def create
      @staff = Staff.new(staff_params)
      if @staff.save
        flash[:info] = 'New staff created successfully.'
        redirect_to admin_staffs_path
      else
        render 'new', status: 400
      end
    end

    def update
      if @staff.update(staff_params)
        flash[:info] = 'Staff information is updated successfully.'
        redirect_to admin_staff_path(@staff)
      else
        flash[:error] = 'Error while updating staff information.'
        render 'edit', status: 400
      end
    end

    def destroy
      @staff.destroy
      flash[:info] = 'Staff deleted successfully.'
      redirect_to admin_staffs_path
    end

    private

    def staff_params
      params.require(:staff).permit(:name, :company_id, :email, :password, :admin)
    end

    def set_staff
      @staff = Staff.find(params[:id])
    end

    def admin_required
      unless Staff.find_by(email: session[:email]).admin.include?('sadmin')
        flash.now[:error] = "You don't have a permission."
        render 'forbidden', status: 400
      end
    end
  end
end
