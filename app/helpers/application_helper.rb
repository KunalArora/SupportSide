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

  def num_disp_link(per_page, num)
    link = %W(#{num} 10 20 50)
    repeat = link[1..3].select{|e| num == e}
    link.map.with_index do |p, i|
      name = i.zero? ? 'All' : p
      if i.zero? && (link.count(num) > 1)
        name
      else
        per_page == p && repeat[0] != p ? name : link_to(name, customers_path(per_page: p.presence), {id: "link#{i + 1}"})
      end
    end.join('|').html_safe
  end
end
