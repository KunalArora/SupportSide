class DevicesController < ApplicationController
  include DevicesAction
  before_action :session_required

  def show
    @key = params.keys.find { |k| %w(serial device_id).include? k }
    @device = TblUserMfc.device_info(@key, params[@key])
    return unless @device.present? && @device.size == 1
    @consumable = consumables(TblDeviceStatus.consumable_status(@device.first.device_id))
    @notification = TblDeviceStatus.notify_status(@device.first.device_id)
    @subscription = TblSubscriptionConfig.subscription_status(@device.first.device_id)
  end
end
