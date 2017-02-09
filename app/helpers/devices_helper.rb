require 'mib_parser'

module DevicesHelper
  def network_status bool
    bool ? 'online' : 'offline'
  end

  def page_count consumable
    page = %w(Total Monochrome Color).freeze
    page.map do |c|
      next unless consumable.key? "#{c}_Page_Count"
#      consumable_status "#{c}_PageCount", consumable["#{c}_Page_Count"]
      ["#{c}_PageCount", consumable["#{c}_Page_Count"]]
    end
  end

  def cons_status consumable
    colors = %w(Black Cyan Magenta Yellow).freeze
    return unless consumable
    colors.map do |c|
      next unless consumable.key? "TonerInk_#{c}"
#      consumable_status "#{c}_Status", consumable["TonerInk_#{c}"]
      [{"#{c}_Status".to_sym =>  consumable["TonerInk_#{c}"]}, {"#{c}_RemainingLife".to_sym => consumable["TonerInk_Life#{c}"]}]
    end
  end

  def remaining_life consumable
    colors = %w(Black Cyan Magenta Yellow).freeze
    return unless consumable
    colors.map do |c|
      next unless consumable.key? "TonerInk_#{c}"
#      consumable_status "#{c}_RemainingLife", consumable["TonerInk_Life#{c}"]
      ["#{c}_RemainingLife", consumable["TonerInk_Life#{c}"]]
    end
  end

  def replace_count consumable
    replace = %w(Black Cyan Magenta Yellow).freeze
    return unless consumable
    replace.map do |c|
      next unless consumable.key? "TonerInk_#{c}_Replace_Count"
#      consumable_status "#{c}_ReplaceCount", consumable["TonerInk_#{c}_Replace_Count"]
      ["#{c}_ReplaceCount", consumable["TonerInk_#{c}_Replace_Count"]]
    end
  end

  def consumables object_id, consumable
    if object_id == '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.10.0'
      page_count(consumable)
    elsif object_id == '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0'
      cons_status(consumable)
  #    remaining_life(consumable)
    elsif object_id == '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.11.0'
    elsif object_id == '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.20.0'
      replace_count(consumable)
    end
  end

  def consumable_status color, value
#    p value
#    p color
#    grades = Hash.new || Hash["#{color}".to_sym] << "#{value}"
#    grades << (Hash["#{color}".to_sym] = "#{value}")
#    p grades
       #  [color, {value: value}]
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
    p consumable
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
