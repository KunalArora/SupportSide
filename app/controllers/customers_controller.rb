require 'will_paginate/array'

class CustomersController < ApplicationController
  include CustomerAction
  before_action :session_required

  def show
    @customer = TblUser.find_by(uid: params[:uuid])
    return unless @customer.present?
    @devices = TblUserMfc.joins(:tbl_user, :tbl_mfc_model).references(:tbl_user, :tbl_mfc_model)
                         .where(id_user: @customer.id).paginate(page: params[:page], per_page: 10)
  end

  def pin_generate
    @customer = params[:uuid]
    @pin = generate(params[:uuid]) if params[:link] == 'pin'
    @outstanding_pins = outstanding(params[:uuid])
    @outs = @outstanding_pins['pins'].paginate(page: params[:page], per_page: 10) if @outstanding_pins['pins'].present?
  end
end
