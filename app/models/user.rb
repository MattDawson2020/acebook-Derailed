class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6, maximum: 20 }

  before_save :downcasemail

  def downcasemail
    self.email.downcase!
  end

  def self.find_name(id)
    user = User.find(id)
    user.name
  end
end
