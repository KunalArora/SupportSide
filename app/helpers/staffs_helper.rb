module StaffsHelper
  def admin_type admin
    if admin == 'sadmin'
      'Super Administrator'
    elsif admin == 'admin'
      'Administrator'
    else
      'Managing Staff'
    end
  end
end
