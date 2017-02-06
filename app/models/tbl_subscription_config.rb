class TblSubscriptionConfig < ApplicationRecord
  OBJECT_ID = '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.1.0'.freeze

  def self.subscription_status id
    TblSubscriptionConfig.find_by(device_id: id, object_id: OBJECT_ID)
  end
end
