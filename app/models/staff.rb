class Staff < ActiveRecord::Base
#  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEXP = \
    /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!-~&&[:^alnum:]])[!-~]+\z/

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 },
                       format: { with: VALID_PASSWORD_REGEXP },
                       allow_nil: true
  validates :company_id, presence: true

  has_secure_password

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
