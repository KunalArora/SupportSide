module ApplicationHelper
  def date_conversion date
    DateTime.strptime(date[0..9].to_i.to_s, '%s').strftime('%d/%m/%Y %H:%M')
  end

  def silent_days last_notify
    (Date.parse((Time.now.utc).to_s) - Date.parse((last_notify).to_s)).to_i
  end

  def strip_time time
    time.strftime "%d/%m/%Y %H:%M"
  end

  def organize_status_by_category item_renamed
    status = {}
    item_renamed.each_key do |category|
      contents = ""
      item_renamed[category].each do |key, value|
        contents += "#{key}#{value}"
      end
      status.store(category, contents)
    end
    return status
  end
end
