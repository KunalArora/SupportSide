module ApplicationHelper
  def date_conversion date
    DateTime.strptime(date[0..9].to_i.to_s, '%s').strftime('%Y-%m-%d %H:%M:%S')
  end
end
