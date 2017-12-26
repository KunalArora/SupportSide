class DevicesController < ApplicationController
  include DevicesAction
  before_action :session_required

  def show
    @key = params.keys.find { |k| %w(serial device_id).include? k }
    @device = TblUserMfc.device_info(@key, params[@key]).paginate(page: params[:page], per_page: 10) if params[@key].present?
    return unless @device.present? && @device.size == 1
    @consumable = consumables(TblDeviceStatus.consumable_status(@device.first.device_id))
  end
end
