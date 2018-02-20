require 'boc_api'

module DeviceSettingAction
  extend ActiveSupport::Concern

  def settings device_id
    req = Net::HTTP::Post.new('/svc_api/devices/get', 'User-Agent' => 'xmpp_test')
    req.set_form_data(
      'service_id' => Rails.application.config.boc_service_id,
      'device_id' => device_id,
      'object_id[0]' => '1.3.6.1.4.1.2435.2.4.3.2435.5.36.33.0',
      'object_id[1]' => '1.3.6.1.4.1.2435.2.4.3.2435.10.1.12.1.3.1',
      'object_id[2]' => '1.3.6.1.4.1.2435.2.4.3.2435.10.1.12.1.4.1',
      'object_id[3]' => '1.3.6.1.4.1.2435.2.4.4.1240.5.2.1.1.1.1',
      'object_id[4]' => '1.3.6.1.4.1.2435.2.4.4.1240.5.2.1.1.2.1',
      'object_id[5]' => '1.3.6.1.4.1.2435.2.4.4.1240.5.2.1.1.3.1',
      'object_id[6]' => '1.3.6.1.4.1.2435.2.4.4.99.1.1.1.2.1',
      'object_id[7]' => '1.3.6.1.4.1.2435.2.4.4.99.1.1.1.3.1'
    )
    send_req(req)
  end

  def delete device_id
    req = Net::HTTP::Post.new('/bol_api/devices/delete', 'User-Agent' => 'xmpp_test')
    req.set_form_data('owner_id' => '2', 'device_id' => device_id)
    send_req(req)
  end

  def reboot device_id
    req = Net::HTTP::Post.new('/svc_api/devices/set', 'User-Agent' => 'xmpp_test')
    req.set_form_data(
      'service_id' => Rails.application.config.boc_service_id,
      'device_id' => device_id,
      'device_info[0][object_id]' => '1.3.6.1.4.1.1240.2.3.4.2.3.0',
      'device_info[0][value]' => '21930'
    )
    send_req(req)
  end

  def enable device_id
    req = Net::HTTP::Post.new('/svc_api/devices/set', 'User-Agent' => 'xmpp_test')
    req.set_form_data(
      'service_id' => Rails.application.config.boc_service_id,
      'device_id' => device_id,
      'device_info[0][object_id]' => '1.3.6.1.4.1.2435.2.4.3.2435.5.36.14.0',
      'device_info[0][value]' => '1'
    )
    send_req(req)
  end

  def search_value object_id, device_id
    req = Net::HTTP::Post.new('/svc_api/devices/get', 'User-Agent' => 'xmpp_test')
    req.set_form_data(
      'service_id' => Rails.application.config.boc_service_id,
      'device_id' => device_id,
      'object_id[0]' => object_id
    )
    send_req(req)
  end

  def notify value
    noti = {}
    value.each do |v|
      noti[v.object_id] = v.updated_date
    end
    noti
  end

  private

  def send_req request
    JSON.parse(BocAPI.new(Rails.application.config.boc_api_endpoint).connect(request))
  end

end
