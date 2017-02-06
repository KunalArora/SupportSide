module DeviceSettingHelper
  def registration_value value
    case value
    when '0'
      'Initializing'
    when '1'
      'Unregistered'
    when '2'
      'Registered'
    when '3'
      'Connection error(on unregistered)'
    when '4'
      'Connection error(on registered)'
    when '5'
      'Clock error'
    when '6'
      'Expiration error'
    when '7'
      'Internal error(on unregistered)'
    when '8'
      'Internal error(on registered)'
    when '9'
      'DNS error A'
    when '10'
      'DNS error B'
    end
  end

  def proxy_name_parse value
    MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.10.1.12.1.3.1')
                       .parse(value)['Proxy_Server_Name']
  end
end
