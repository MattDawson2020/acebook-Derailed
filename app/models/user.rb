class User < ApplicationRecord
  has_many :comments
  has_many :posts, dependent: :destroy

  has_secure_password
  has_one_attached :image

  has_many :invitations
  has_many :pending_invitations, -> { where confirmed: false}, class_name: "Invitation", foreign_key: "friend_id"

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
  
  def friends
    sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    received_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = sent_invitation + received_invitation
    User.where(id: ids)
  end

  def friends_with?(user)
    Invitation.accepted?(id, user.id)
  end


  def send_invite(id)
    invitations.create(friend_id: id)
  end
  
  def display_name
    self.nickname ? self.nickname : self.name
  end

end
