module CustomersHelper
  def network_status bool
    bool ? 'online' : 'offline'
  end
end
