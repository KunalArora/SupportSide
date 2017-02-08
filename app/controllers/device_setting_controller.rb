class DeviceSettingController < ApplicationController
  include DeviceSettingAction

  before_action :session_required
  before_action :set_param, only: %w(setting reboot_device enable_log delete_device device_search)
  def show
    @device = params[:device_id]
    @customers = TblUser.joins(:tbl_user_mfcs).references(:tbl_user_mfcs)
                        .find_by(tbl_user_mfcs: { device_id: params[:device_id] })
  end

  def setting
    @setting = settings(@device_id)
  end

  def reboot_device
    @reboot = reboot(@device_id)
  end

  def enable_log
    @enable = enable(@device_id)
  end

  def delete_device
    @delete = delete(@device_id)
  end

  def device_search
    @value = search_value(params[:object_id], @device_id)
  end

  private

  def set_param
    @uuid = params[:uuid]
    @device_id = params[:device_id]
  end
end
