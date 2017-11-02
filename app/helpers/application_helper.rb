module ApplicationHelper
  def date_conversion date
    DateTime.strptime(date[0..9].to_i.to_s, '%s').strftime('%Y-%m-%d %H:%M:%S')
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
