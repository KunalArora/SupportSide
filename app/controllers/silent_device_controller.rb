class SilentDeviceController < ApplicationController

  def show
  end

  def search
    @days = params[:silent_search]['days']
    @silent_device_list, @notify = TblUserMfc.silent_device(@days);
    @total_silent = @silent_device_list.size.to_i
    if params[:per_page].nil?
      params[:per_page] = @silent_device_list.size.to_s
      @num_all = params[:per_page]
    end
    @silent_device_list = @silent_device_list.paginate(page: params[:page], per_page: params[:per_page]);
  end
end
