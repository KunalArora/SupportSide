module Admin::StaffsHelper
  def admin_type admin
    if admin == 'sadmin'
      'Super Administrator'
    elsif admin == 'loadmin'
      'Local Office Administrator'
    elsif admin == 'lomstaff'
      'Local Office Managing Staff'
    else
      'Service Desk'
    end
  end
end
