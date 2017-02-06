class TblUserMfc < ApplicationRecord
  belongs_to :tbl_mfc_model, foreign_key: 'id_model', class_name: 'TblMfcModel'
  belongs_to :tbl_user, foreign_key: 'id_user', class_name: 'TblUser'
  has_one :tlb_serial_mfc, foreign_key: 'id_mfc'

  scope :includes_device_information, lambda {
    joins(:tbl_user, :tbl_mfc_model).references(:tbl_user, :tbl_mfc_model)
  }

  scope :search_with_query, lambda { |key, value|
    case key
    when 'device_id'
      where('device_id=? AND status!=?', "#{value}", '-1')
    when 'serial'
      if value.size == 9
        where('serial LIKE ? AND status!=?', "%#{value}", '-1')
      else
        where('serial=? AND status!=?', "#{value}", '-1')
      end
    end
  }

  def self.device_info key, value
    includes_device_information.search_with_query(key, value)
  end
end
