require 'csv'
module CsvUtility
  def to_csv column, values, basic_info, device_id, log_type, period
      CSV.generate do |csv|
        csv << log_type
        csv << ['FROM', period[:from].strftime('%d/%m/%Y %H:%M')]
        csv << ['TO', period[:to].strftime('%d/%m/%Y %H:%M')]
        csv << column
        values.each do |date, value|
         csv << [device_id, Time.parse(date).strftime('%d/%m/%Y %H:%M'), basic_info, value].flatten
      end
    end
  end

  def date_list response_data
    list = response_data.map{|item| item['updated']}
    list.compact.flatten.uniq.sort
  end

  def create_csv_format_notification_log date_list, response_data, features
    data_to_csv = Hash.new
    pre_value = Hash.new
    features.each do |feature|
      pre_value[feature] = '-'
    end
    date_list.each do |date|
      list = Array.new
      features.each do |feature|
        count = 0
        data_selected = response_data.select { |item|
          item['feature'] == feature
        }
        if data_selected.present? && data_selected[0]['updated']
          if data_selected[0]['updated'].include?(date)
            index = data_selected[0]['updated'].find_index(date)
            value = data_selected[0]['value'][index].present? ? data_selected[0]['value'][index] : pre_value[feature]
            pre_value[feature] = value
            list << value
            count = 1
          end
        end
        list << pre_value[feature] if count == 0
        data_to_csv.store(date, list)
      end
    end
    data_to_csv = Hash[data_to_csv.to_a.reverse]
  end

  def create_csv_format_network_status_log date_list, response_data
    data_to_csv = Hash.new
    date_list.each do |date|
      count = 0
      list = Array.new
      if response_data['updated']
        if response_data['updated'].include?(date)
          index = response_data['updated'].find_index(date)
          value = response_data['value'][index].present? ? response_data['value'][index] : '-'
          list << value
          count = 1
        end
      end
      list << '-' if count == 0
      data_to_csv.store(date, list)
    end
    data_to_csv = Hash[data_to_csv.to_a.reverse]
  end

  def create_csv_format_basic_log basic_log
    csv_format = []
    basic_log.each_value do |v|
      csv_format << (v.present? ? v : '-')
    end
    csv_format
  end

  def create_csv_format_log_type log_type
    case log_type
      when 'consumable'
        ['Consumable Status']
      when 'printcount'
        ['Print Count']
      end
  end
end
