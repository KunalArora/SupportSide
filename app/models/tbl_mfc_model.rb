class TblMfcModel < ApplicationRecord
  has_many :tbl_users, foreign_key: 'mfc_id'
  has_many :tbl_user_mfcs, foreign_key: 'id_model'
  has_one :tlb_serial_mfc, foreign_key: 'id_model'
end
