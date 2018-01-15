class SilentDeviceController < ApplicationController

  before_action :session_required
  def show
  end

  def search
    @days = params[:unresponsive_search]['days']
    if (/\A\d+\z/ =~ @days)
      @silent_device_list, @notify = TblUserMfc.silent_device(@days);
      @total_silent = @silent_device_list.size.to_i
      if params[:per_page].nil?
        params[:per_page] = @silent_device_list.size.to_s
        @num_all = params[:per_page]
      end
      @silent_device_list = @silent_device_list.paginate(page: params[:page], per_page: params[:per_page]);
    else
      flash.now[:error] = "Invalid query parameter. Enter a valid Integer value."
      render status: 400
    end
  end
end
