class CustomersController < ApplicationController
  before_action :session_required

  def show
    @customer = TblUser.find_by(uid: params[:uuid])
    return unless @customer.present?
    @devices = TblUserMfc.joins(:tbl_user, :tbl_mfc_model).references(:tbl_user, :tbl_mfc_model)
                         .where(id_user: @customer.id)
                         .paginate(page: params[:page], per_page: 10)
#    ar = []
#    @devices.each do |a|
#      ar << a.device_id
#    end
#    p ar
#    @value = TblDeviceStatus.where(device_id: ar).group(:device_id, :id).order(updated_date: :desc).limit(1)
#    @value = TblDeviceStatus.where(id: TblDeviceStatus.where(device_id: ar).group(:device_id, :id)).order(updated_date: :desc).limit(1)
#    p @value
  end
end
