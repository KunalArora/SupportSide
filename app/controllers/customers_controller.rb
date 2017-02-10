class CustomersController < ApplicationController
  before_action :session_required

  def show
    @customer = TblUser.find_by(uid: params[:uuid])
    return unless @customer.present?
    @devices = TblUserMfc.joins(:tbl_user, :tbl_mfc_model).references(:tbl_user, :tbl_mfc_model)
                         .where(id_user: @customer.id)
                         .paginate(page: params[:page], per_page: 10)
    ar = []
    @devices.each do |m|
      ar << m.device_id
    end
    #ar << @devices.first.device_id
    p ar
    @result = TblDeviceStatus.notification(ar)
    @result.each do |r|
      
    end
   end
end
