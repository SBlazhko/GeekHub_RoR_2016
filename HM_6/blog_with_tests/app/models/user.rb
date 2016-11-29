class User < ApplicationRecord

  has_secure_password
  mount_uploader :avatar, AvatarUploader

  has_many :posts

  validates :email, presence: :true
  validates :password, presence: :true, length: {minimum: 6}
  
end
