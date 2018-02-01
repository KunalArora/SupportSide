module DevicesHelper
  def online_status online, subscription
    if online
      subscription ? {msg: 'Device is Online'} : {msg: 'Device is Online but NOT subscribed', color: 'red'}
    else
      subscription ? {msg: 'Device is Offline', color: 'red'} : {msg: 'Device is Offline and NOT subscribed'}
    end
  end

  def network_status bool
    bool ? 'online' : 'offline'
  end

  def subscribe_status status
    case status
    when 0
      'Sending Request'
    when 1
      'Request Sent(Device is Offline)'
    when 2
      'Subscribed'
    end
  end

  def query_opp key
    if key == 'serial'
      'Device ID or another Serial number'
    else
      'Serial number or another Device ID'
    end
  end

  def ink_status status
    case status
    when '1'
      'Normal'
    when '2'
      'Low'
    when '3'
      'Empty'
    when '4'
      'No Cartridge'
    when '5'
      'Empty(Warning)'
    when '6'
      'Ended'
    when '7'
      'Remaining Life Error(Warning)'
    end
  end

  def drum_belt_status status
    case status
    when '1'
      'Normal'
    when '2'
      'Low'
    when '3'
      'Replace'
    when '4'
      'No Unit'
    when '6'
      'Stop'
    end
  end

  def waste_box_status status
    case status
    when '1'
      'Normal'
    when '2'
      'Near'
    when '3'
      'Full'
    when '4'
      'No Unit'
    end
  end

  def get_connection_type name
    unless name.nil?
      if name.index('USB')
        "BOAgent(USB)"
      elsif name.index('NW')
        "BOAgent(Network)"
      else
        "BOC direct"
      end
    end
  end

  def offline_days last_presence
    last_presence = date_conversion(last_presence)
    return (Date.parse((Time.now.utc).to_s) - Date.parse((last_presence).to_s)).to_i
  end
end
