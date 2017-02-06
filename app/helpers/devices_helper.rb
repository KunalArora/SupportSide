require 'mib_parser'

module DevicesHelper
  def network_status bool
    bool ? 'online' : 'offline'
  end

  def consumables consumable
    colors = %w(Black Cyan Magenta Yellow).freeze
    return unless consumable
    colors.map do |c|
      next unless consumable.key? "TonerInk_#{c}"
      consumable_status c, consumable["TonerInk_Life#{c}"]
    end
  end

  def consumable_status color, value
    [color.to_s, { value: value }]
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

  def parser consumable
    return unless consumable.present?
    MIBParser::ObjectId.new(consumable['object_id'])
                       .parse(consumable['status'])
  end

  def query_opp key
    if key == 'serial'
      'Device ID or another Serial number'
    else
      'Serial number or another Device ID'
    end
  end
end
