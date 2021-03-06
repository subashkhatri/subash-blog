class User < ActiveRecord::Base
  paginates_per 5
  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 2, maximum: 25 }

  VALID_EMAIL_REGX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGX }
  has_secure_password
end
