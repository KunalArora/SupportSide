require 'api_call'

module CustomerAction
  extend ActiveSupport::Concern

  def generate cust_uid
    req = Net::HTTP::Post.new('/bol_api/devices/pin/create_multidevice')
    req.set_form_data(
      'owner_id' => 2, 'uid' => cust_uid, 'device_count' => 1,
      'expires' => (Time.now + 6.months).iso8601, 'can_delete' => 1
    )
    JSON.parse(BOC::API.new(Rails.application.secrets.boc_api_endpoint).connect(req))
  end

  def outstanding cust_uid
    req = Net::HTTP::Post.new('/bol_api/accounts/pin/outstanding')
    req.set_form_data(
      'owner_id' => 2, 'uid' => cust_uid
    )
    JSON.parse(BOC::API.new(Rails.application.secrets.boc_api_endpoint).connect(req))
  end
end
