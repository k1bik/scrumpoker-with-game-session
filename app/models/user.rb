class User < ApplicationRecord
  has_secure_password

  NAME_LENGTH = 25

  validates :name, :password_digest, presence: true
  validates :name, uniqueness: true
  validates :name, length: {maximum: NAME_LENGTH}
end
