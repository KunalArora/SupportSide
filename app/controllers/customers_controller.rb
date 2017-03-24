require 'will_paginate/array'

class CustomersController < ApplicationController
  include CustomerAction
  before_action :session_required

  def show
    @customer = TblUser.find_by(uid: params[:uuid])
    return unless @customer.present?
    @devices = @customer.tbl_user_mfcs.paginate(page: params[:page], per_page: 10)
    @notify = @devices.left_joins(:tbl_device_statuses).group(:device_id).maximum(:updated_date)
  end

  def pin_generate
    @customer = params[:uuid]
    @pin = generate(params[:uuid]) if params[:link] == 'pin'
    @outstanding_pins = outstanding(params[:uuid])
    @pins = @outstanding_pins['pins'].reverse.paginate(page: params[:page], per_page: 10) if @outstanding_pins['pins'].present?
  end
end
