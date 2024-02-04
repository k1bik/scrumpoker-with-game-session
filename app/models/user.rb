class User < ApplicationRecord
  has_secure_password

  NICKNAME_LENGTH = 25

  validates :nickname, :password_digest, presence: true
  validates :nickname, uniqueness: true
  validates :nickname, length: {maximum: NICKNAME_LENGTH}
end
