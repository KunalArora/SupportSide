module SilentDeviceHelper
  def date_convert date
    DateTime.strptime(date[0..9].to_i.to_s, '%s').strftime('%d/%m/%Y %H:%M')
  end

  def num_disp(per_page, num, days)
    link = %W(#{num} 10 20 50)
    repeat = link[1..3].select{|e| num == e}
    link.map.with_index do |p, i|
      name = i.zero? ? 'All' : p
      if i.zero? && (link.count(num) > 1)
        name
      else
        per_page == p && repeat[0] != p ? name : link_to(name, silent_device_search_path(per_page: p.presence, unresponsive_search: {days: days}), {id: "link#{i + 1}"})
      end
    end.join('|').html_safe
  end
end
