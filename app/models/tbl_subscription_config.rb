class TblSubscriptionConfig < ApplicationRecord
  belongs_to :tbl_user_mfc, primary_key: 'device_id', foreign_key: 'device_id', class_name: 'TblUserMfc'
end
