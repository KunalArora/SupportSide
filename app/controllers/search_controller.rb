class SearchController < ApplicationController
  include SearchAction

  before_action :session_required

  def query
    return if params[:search].blank?
    path = redirect_path(params[:search])
    if path
      redirect_to path
    else
      flash.now[:error] = 'Invalid query parameter.'
      render status: 400
    end
  end
end
