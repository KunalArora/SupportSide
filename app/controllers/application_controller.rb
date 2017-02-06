class ApplicationController < ActionController::Base
  include SessionsAction
  protect_from_forgery with: :exception
end
