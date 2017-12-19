class TblSubscriptionConfig < ApplicationRecord
  belongs_to :tbl_user_mfc, primary_key: 'device_id', foreign_key: 'device_id', class_name: 'TblUserMfc'

  def self.search_device_against_particular_object_id object_id
    TblSubscriptionConfig.where(service_id: 2, object_id: object_id)
  end
end
