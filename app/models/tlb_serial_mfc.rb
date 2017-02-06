class TlbSerialMfc < ApplicationRecord
  belongs_to :tbl_mfc_model, foreign_key: 'id_model', class_name: 'TblMfcModel'
  belongs_to :tbl_user_mfc, foreign_key: 'id_mfc', class_name: 'TblUserMfc'
end
