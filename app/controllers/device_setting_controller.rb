class DeviceSettingController < ApplicationController
  include DeviceSettingAction

  before_action :session_required
  before_action :set_param, only: %w(setting reboot_device enable_log delete_device device_search maintenance_information subscription)
  before_action :device_information, :is_subscription
  def show
    @device = params[:device_id]
    @customers = TblUser.joins(:tbl_user_mfcs).references(:tbl_user_mfcs)
                        .find_by(tbl_user_mfcs: { device_id: params[:device_id] })
  end

  def setting
    @setting = settings(@device_id)
  end

  def maintenance_information
    @status, @updated_at = TblDeviceStatus.maintenance_information(@device_id)
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

  def subscription
    @subscribe = TblSubscriptionConfig.where(device_id: @device_id).paginate(page: params[:page], per_page: 6) if @device_id.present?
    @notify = notify(TblDeviceStatus.where(device_id: @device_id))
  end


  private

  def set_param
    @uuid = params[:uuid]
    @device_id = params[:device_id]
  end

  def device_information
    @device_info = TblUserMfc.device_info('device_id', params[:device_id]).first
  end

  def is_subscription
    @subscription = TblSubscriptionConfig.exists?(device_id: params[:device_id])
  end
end
