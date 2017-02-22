require 'mib_parser'

module DevicesAction
  extend ActiveSupport::Concern

  def notify value
    noti = {}
    value.each do |v|
      noti[v.object_id] = v.updated_date
    end
    noti
  end

  def parser consumable
    return unless consumable.present?
    MIBParser::ObjectId.new(consumable['object_id'])
                       .parse(consumable['status'])
  end

  def consumables consumable
    result = {}
    consumable.each do |c|
      result = result.merge(parser(c))
    end
    result
  end
end
