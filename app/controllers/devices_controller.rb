class DevicesController < ApplicationController
  include DevicesAction
  before_action :session_required

  def show
    @key = params.keys.find { |k| %w(serial device_id).include? k }
    @device = TblUserMfc.device_info(@key, params[@key]).paginate(page: params[:page], per_page: 10) if params[@key].present?
    @notify = @device.left_joins(:tbl_device_statuses).group(:device_id).maximum(:updated_date)
    return unless @device.present? && @device.size == 1
    @consumable = consumables(TblDeviceStatus.consumable_status(@device.first.device_id))
    @subscription = TblSubscriptionConfig.exists?(device_id: @device.first.device_id)
  end

  def subscription
    @device_id = params[:uuid]
    @subscribe = TblSubscriptionConfig.where(device_id: @device_id).paginate(page: params[:page], per_page: 6) if @device_id.present?
    @notify = notify(TblDeviceStatus.where(device_id: @device_id))
  end
end
