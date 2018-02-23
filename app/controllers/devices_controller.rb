class DevicesController < ApplicationController
  include DevicesAction
  before_action :session_required

  def show
    @key = params.keys.find { |k| %w(serial device_id).include? k }
    @device = TblUserMfc.device_info(@key, params[@key]).paginate(page: params[:page], per_page: 10) if params[@key].present?
    return unless @device.present? && @device.size == 1
    @consumable = consumables(TblDeviceStatus.consumable_status(@device.first.device_id))
    @subscription = TblSubscriptionConfig.exists?(device_id: @device.first.device_id)
  end

  def history_log
    @device = TblUserMfc.includes(:tbl_user).find_by(device_id: params[:device_id])
    @checked_period = {noti: NOTIFICATION_PERIOD_DEFAULT, net: NETWORKSTATUS_PERIOD_DEFAULT}
    @checked_timeunit = NOTIFICATION_TIMEUNIT_DEFAULT
    @checked_item = NOTIFICATION_ITEM_DEFAULT
    @disabled = {noti: !@checked_period[:noti]['specific_period'], net: !@checked_period[:net]['specific_date']}
    @value = {noti: NOTIFICATION_TEXT_DEFAULT, net: NETWORKSTATUS_TEXT_DEFAULT}
  end

  def notification_log
    @device = TblUserMfc.find_by(device_id: params[:device_id])
    begin
      res = @device.get_notification_log(params[:log_noti], params[:device_id])
    rescue
      if $ERROR_INFO.data.code == '504'
        flash.now[:error_notifi] = 'Request timed out. You should shorten the Specific period or widen the Time unit.'
      else
        flash.now[:error_notifi] = 'Internal server error. Please try again later.'
      end
    end
    if res
      send_data(res, filename: "#{@device.serial}_#{return_abbreviation(params[:log_noti]['reporting_item'])}_#{Time.now.utc.strftime("%d%m%Y")}.csv")
    else
      flash.now[:error_notifi] = "Logs Not Found" if flash.now[:error_notifi].nil?
      @checked_period = {noti: return_radio_box_status(params[:log_noti]['period'], NOTIFICATION_PERIOD), net: NETWORKSTATUS_PERIOD_DEFAULT}
      @checked_timeunit = @checked_period[:noti]['specific_period'] ? return_radio_box_status(params[:log_noti]['time_unit'], NOTIFICATION_TIMEUNIT) : NOTIFICATION_TIMEUNIT_DEFAULT
      @checked_item = return_radio_box_status(params[:log_noti]['reporting_item'], NOTIFICATION_ITEM)
      @value = {noti: {'from' => params[:log_noti]['from'], 'to' => params[:log_noti]['to']}, net: NETWORKSTATUS_TEXT_DEFAULT}
      @disabled = {noti: !@checked_period[:noti]['specific_period'], net: !@checked_period[:net]['specific_date']}
      render action: 'history_log'
    end
  end

  def network_status_log
    @device = TblUserMfc.find_by(device_id: params[:device_id])
    begin
      res = @device.get_network_status_log(params[:log_net], params[:device_id])
    rescue
      if $ERROR_INFO.data.code == '504'
        flash.now[:error_network] = 'Request timed out.'
      else
        flash.now[:error_network] = 'Internal server error. Please try again later.'
      end
    end
    if res
      send_data(res, filename: "#{@device.serial}_NS_#{Time.now.utc.strftime("%d%m%Y")}.csv")
    else
      flash.now[:error_network] = 'Logs Not Found' if flash.now[:error_network].nil?
      @checked_period = {noti: NOTIFICATION_PERIOD_DEFAULT, net: return_radio_box_status(params[:log_net]['period'], NETWORKSTATUS_PERIOD)}
      @value = {noti: NOTIFICATION_TEXT_DEFAULT, net: params[:log_net]['date']}
      @disabled= {noti: !@checked_period[:noti]['specific_period'], net: !@checked_period[:net]['specific_date']}
      @checked_timeunit = NOTIFICATION_TIMEUNIT_DEFAULT
      @checked_item = NOTIFICATION_ITEM_DEFAULT
      render action: "history_log"
    end
  end
end
