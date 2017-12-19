module CustomersHelper
  def network_status bool
    bool ? 'online' : 'offline'
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
