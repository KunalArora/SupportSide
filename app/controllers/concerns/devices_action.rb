module DevicesAction
  extend ActiveSupport::Concern

  def notify value
    ha = {}
    value.each do |v|
      ha[v.object_id] = v.updated_date
    end
    ha
  end
end
