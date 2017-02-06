class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "#{Rails.env}_boc".to_sym
end
