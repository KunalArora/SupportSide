module Admin::StaffsHelper
  def admin_type admin
    case admin
    when 'sadmin'
      'Super Administrator'
    when 'admin'
      'Administrator'
    when 'mstaff'
      'Managing Staff'
    end
  end
end
