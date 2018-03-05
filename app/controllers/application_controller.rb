class ApplicationController < ActionController::Base
  include SessionsAction
  protect_from_forgery with: :reset_session
end
