class User < ApplicationRecord
  has_many :comments
  has_many :posts, dependent: :destroy

  has_secure_password
  has_one_attached :image

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :email,  presence: true #password
  validates :email, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  # validates :password, length: { minimum: 6, maximum: 20 }
  # validates :password, confirmation: { case_sensitive: true }
  before_save :downcasemail

  
  def downcasemail
    self.email.downcase!
  end

  def self.find_name(id)
    user = User.find(id)
    user.name
  end
end
