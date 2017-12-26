require 'will_paginate/array'

class CustomersController < ApplicationController
  include CustomerAction
  before_action :session_required

  def show
    @customer = TblUser.find_by(uid: params[:uuid])
    return unless @customer.present?
    if params[:per_page].nil?
      params[:per_page] = @customer.tbl_user_mfcs.size.to_s
      @num_all = params[:per_page]
    end
    @devices = @customer.tbl_user_mfcs.paginate(page: params[:page],per_page: params[:per_page])
    device_id = @devices.map(&:device_id)
  end

  def pin_generate
    @customer = params[:uuid]
    customer_owner_id = TblUser.find_by(uid: params[:uuid]).owner_id
    @pin = generate(params[:uuid], customer_owner_id) if params[:link] == 'pin'
    @outstanding_pins = outstanding(params[:uuid])
    @pins = @outstanding_pins['pins'].reverse.paginate(page: params[:page], per_page: 10) if @outstanding_pins['pins'].present?
  end

  def download_device_information_csv
    device_informations = TblUserMfc.get_device_information_csv(params[:uuid], params[:check_box])
    send_data(device_informations, filename: "#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_latest_device_information.csv")
  end
end
