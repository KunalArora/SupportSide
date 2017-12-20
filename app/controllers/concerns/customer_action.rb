require 'api_call'
require 'staff.rb'

module CustomerAction
  extend ActiveSupport::Concern

  def generate cust_uid, cust_owner_id
    req = Net::HTTP::Post.new('/bol_api/devices/pin/create_multidevice')
    req.set_form_data(
      'owner_id' => cust_owner_id, 'uid' => cust_uid, 'device_count' => 1,
      'expires' => (Time.now + 6.months - 1.day).iso8601, 'can_delete' => 1
    )
    JSON.parse(BOC::API.new(Rails.application.secrets.boc_api_endpoint).connect(req))
  end

  def outstanding cust_uid
    req = Net::HTTP::Post.new('/bol_api/accounts/pin/outstanding')
    req.set_form_data(
      'owner_id' => logged_in_staff.company_id, 'uid' => cust_uid
    )
    JSON.parse(BOC::API.new(Rails.application.secrets.boc_api_endpoint).connect(req))
  end

  private

  def logged_in_staff
    Staff.find_by(email: session[:email])
  end
end
