class TblDeviceStatus < ApplicationRecord
  belongs_to :tbl_users, foreign_key: 'user_id', class_name: 'TblUser'

  OBJECT_ID = '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0'.freeze

  def self.consumable_status id
    TblDeviceStatus.find_by(device_id: id, object_id: OBJECT_ID)
  end

  def self.notify_status id
    TblDeviceStatus.where(device_id: id).order(updated_date: :desc).first
  end
end
