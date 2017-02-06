class TblUser < ApplicationRecord
  belongs_to :tbl_mfc_model, foreign_key: 'mfc_id', class_name: 'TblMfcModel'
  has_many :tbl_user_mfcs, foreign_key: 'id_user', class_name: 'TblUserMfc'
  has_many :tbl_device_statuses, foreign_key: 'user_id', class_name: 'TblDeviceStatus'
end
